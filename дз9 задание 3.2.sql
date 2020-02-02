-- вроде слелала как в вебинаре, не пойму почему не проходит((( мне кажется - я безнадежна...
create trigger cheking_records
after insert
on shop.products for each row
	if new.name = null and new.description = null then
		signal sqlstate '45000' set message_text = 'table fieldds cannot be equal NULL';
		-- set new.name = catalog_id;
	end if;
