using UnityEngine;
using System.Collections;

public class ItemSwap : MonoBehaviour {

	Transform mountPoint;
	public Transform StashPoint;

	// Use this for initialization
	void Start () {
		mountPoint = GetComponent<PlayerPickUp> ().mountPoint;
	}
	
	// Update is called once per frame
	void Update () {
		if (Input.GetKeyDown (KeyCode.Q)) {

			var mountedItem = GetItem(mountPoint);
			var stasheditem = GetItem(StashPoint);

			Move (mountedItem,StashPoint);
			Move (stasheditem,mountPoint);
		}

	}

	private Component GetItem(Transform point) {
		return point.GetComponentInChildren(typeof(IPickupable));
	}

	private void Move (Component mountedPoint, Transform to) {
		if (mountedPoint != null) {
						mountedPoint.transform.parent = to;
				}
	}

}
