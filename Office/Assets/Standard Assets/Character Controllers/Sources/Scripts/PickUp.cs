using UnityEngine;
using System.Collections;

public class PickUp : MonoBehaviour {

	GameObject pickUpObject;


	void OnTriggerEnter(Collider other) {
		if (other.gameObject.tag == @"PickUp") {
			pickUpObject = other.gameObject;
		}
	}

	void Update () {
		
		if (Input.GetKey(KeyCode.E)) 
		pickUpObject.SetActive(false);	

	}

}
