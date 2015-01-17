using UnityEngine;
using System.Collections;

public class Spawner : MonoBehaviour {

	public GameObject enemy;
	public GameObject tester;
	public float spawnOffset=0.35f;

	Vector3 randomSpawnPoint
	{
		get
		{
			int randIndex = Random.Range(0,transform.childCount-1);
			var position = transform.GetChild(randIndex).position+Random.insideUnitSphere*spawnOffset;
			position.y=0;
			return position;
		}
	}


	// Use this for initialization
	void Start () {
	
		for (int i=0; i<transform.childCount; i++) {
			var enemyObject = (GameObject)Instantiate(enemy,randomSpawnPoint,Quaternion.identity);
			var ai = enemyObject.GetComponent<AIFollow>();
			ai.target =tester.transform;
				}


	}
	
	// Update is called once per frame
	void Update () {
	
		if (tester.activeInHierarchy) {
			var ai = tester.GetComponent<AIFollow>();
			ai.target = enemy.transform;	
		}

	}
}
