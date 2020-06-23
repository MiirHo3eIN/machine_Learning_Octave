
function test_plot(X,Y) 
	figure ; hold on; 
	ln = size(X,1);
	for i=1:ln,
		if Y(i,1) == 0,
	   			plot(X(i,1), X(i,2),'ko'); 
		elseif Y(i,1) == 1,
   	  			plot(X(i,1), X(i,2), 'b+');
   	  	end
	end
	hold off;
end