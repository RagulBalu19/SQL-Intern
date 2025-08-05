use FoodDelivery;

update OrderItem
set Quantity = 2
where OrderItemId =502;

delete from OrderItem
Where OrderItemId = 503;

select * from OrderItem;