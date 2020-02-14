contract ReleasableSimpleCoin {
    bool public released = false;

    ...

    function release() onlyOwner {
        released = true;
    }

    function transfer(address _to, uint256 _amount) public {
        require(_to != 0x0); 
        require(coinBalance[msg.sender] > _amount);
        require(coinBalance[_to] + _amount >= coinBalance[_to] );
         
        if (released ) {
            coinBalance[msg.sender] -= _amount;  
            coinBalance[_to] += _amount;   
            emit Transfer(msg.sender, _to, _amount); 

            return true; 
        }
        revert();
    }

    function transferFrom(address _from, address _to, uint256 _amount) 
        public returns (bool success) {

        require(_to != 0x0);  
        require(coinBalance[_from] > _amount); 
        require(coinBalance[_to] + _amount >= coinBalance[_to] ); 
        require(_amount <= allowance[_from][msg.sender]);  

        if (released ) {
            coinBalance[_from] -= _amount; 
            coinBalance[_to] += _amount; 
            allowance[_from][msg.sender] -= _amount;
            emit Transfer(_from, _to, _amount);

            return true;
        }
        revert();
        
    }
    

    ...
    
}