//Custom Contract factory, will deploy Custom Escrow contracts
pragma solidity ^0.8.4;
import "./DecentralizedMarketplaceEscrowsBEP20.sol";


contract PIXULFactory{

    PixulEscrow[] public existingContracts;
    event newOrderCreated(PixulEscrow escrow);

    address private escrowMediator = 0x0a6E7995826B10eC75CAa3f3084D1A60412afC8E;


    constructor(address _escrowMediator) {
        escrowMediator = _escrowMediator;
    }
    function createEscrow(address payable payer, address payable payee, IERC20 paymentToken) external{
        PixulEscrow escrow = new PixulEscrow(payer,payee,paymentToken);
        existingContracts.push(escrow);
        emit newOrderCreated(escrow);
    }

    function queryEscrows() external view returns (PixulEscrow[] memory){
        return existingContracts;
    }
}
