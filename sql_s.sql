select 
        queried_data.date as value,
	concat(queried_data.date, ' - ', queried_data.name, ': ', queried_data.notes) as label
from (
    select
		concat('s_',s_name.instance) as type, s_name.*, date, notes
    from
		(
			select
				project_id, record, ifnull(instance,1) as instance, value as name
			from 
				redcap_data where project_id = [project-id] 
				and record = [record-name] 
				and field_name = 'notes_name_s' 
			order by 
				instance
		) s_name
		inner join (
			select 
				ifnull(instance,1) as instance, value as date 
			from 
				redcap_data 
			where 
				project_id = [project-id] and record = [record-name] 
				and field_name = 'worknote_date_s'
			order by instance
		) s_date on s_name.instance = s_date.instance
		inner join (
			select 
				ifnull(instance,1) as instance, REPLACE(value,'\n','</br>') as notes 
			from 
				redcap_data where project_id = [project-id] 
				and record = [record-name] and field_name = 'notes_s' 
			order by instance
		) s_note on s_name.instance = s_note.instance

    union 

    select
		concat('pc_',pc_name.instance), pc_name.*, date, notes
    from 
		(
			select 
				project_id, record, ifnull(instance,1) as instance, value as name
			from 
				redcap_data 
			where 
				project_id = [project-id]
				and record = [record-name] 
				and field_name = 'notes_name_pc' 
			order by 
				instance
		) pc_name
		inner join (
			select 
				ifnull(instance,1) as instance, value as date 
			from 
				redcap_data 
			where 
				project_id = [project-id] 
				and record = [record-name] 
				and field_name = 'worknote_date_pc' 
			order by 
				instance
		) pc_date on pc_name.instance = pc_date.instance
		inner join (
			select 
				ifnull(instance,1) as instance, REPLACE(value,'\n','</br>') as notes
			from 
				redcap_data
			where project_id = [project-id] 
				and record = [record-name]
				and field_name = 'notes_pc'
			order by 
				instance
		) pc_note on pc_name.instance = pc_note.instance
) queried_data
order by queried_data.date