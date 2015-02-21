using UnityEngine;
using System.Collections;

public class CreateUser : MonoBehaviour {

	public UIInput userNameText;
	string appKey = "xUsXnWm2Hicuw1gYH6x0EwlWR4e9KMMOKbouQuNol3Wuo*xpLFAiGeSFA+EWvgHyGSsYzoz4cJKdzRg43Qs0jQ==";


	void OnClick() {

		string userName = userNameText.text;
		PlayerPrefs.SetString ("Player Name", userName);		
		createUser (userName);
		createUserWallet (userName);

		Application.LoadLevel("Office");
	}

	void createUser(string userName)
	{
		string url = "http://cappcloudcommerce.cloudapp.net/api/v1/commerce/userwallet/CreateGameUser/" + userName + "/" +appKey;
		WWW www = new WWW(url);
		StartCoroutine(WaitForRequest(www));

	}

	void createUserWallet(string userName)
	{
		string url = "http://cappcloudcommerce.cloudapp.net/api/v1/commerce/userwallet/CreateUserWallet/" + userName + "/" +appKey;
		WWW www = new WWW(url);
		StartCoroutine(WaitForRequest(www));
	}


	IEnumerator WaitForRequest(WWW www)
	{
		yield return www;
		
		// check for errors
		if (www.error == null)
		{
			Debug.Log("WWW Ok!: " + www.data);
		} else {
			Debug.Log("WWW Error: "+ www.error);
		}
	}

}
