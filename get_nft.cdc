// get_nft.cdc

import Nftly from 0xa31975fccc40116e


pub fun main(id: UInt64, to: Address) :  {String : String}  {
    // Get the public account object for account "to"
    let nftOwner = getAccount(to)

    // Find the public Receiver capability for their Collection
    let capability = nftOwner.getCapability<&{Nftly.NFTReceiver}>(/public/NFTReceiver)

    // borrow a reference from the capability
    let receiverRef = capability.borrow()
        ?? panic("Could not borrow the receiver reference")

    // Log the NFTs that they own as an array of IDs
    log("Account  NFTs")
    return receiverRef.getMetadata(id: id)
}
