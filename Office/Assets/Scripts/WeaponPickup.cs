using UnityEngine;
using System.Collections;

public class WeaponPickup : MonoBehaviour,IPickupable {

	#region IPickupable implementation

	public void PickUp (GameObject player)
	{
		var mountPoint = player.GetComponent<PlayerPickUp> ().mountPoint;	
		transform.parent = mountPoint;

	}

	#endregion
}
