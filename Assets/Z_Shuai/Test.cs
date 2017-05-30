using UnityEngine;
using System.Collections;
using UnityEngine.UI;

public class Test : MonoBehaviour {

	
	void Start () {
        Image image = gameObject.GetComponent<Image>();
        image.color = new Color32(0, 0, 0, 0);
        //image.overrideSprite

        Animator ac = new Animator();
        ac.SetTrigger("attack");
        ac.SetFloat("aa", 123f);
        //Instantiate();

        ParticleSystem p = new ParticleSystem();
        p.Play();
        p.Stop();
        //p.startLifetime;
        p.gameObject.layer = 1;
        p.gameObject.GetComponent<Rigidbody>().AddForce(1, 1, 1);

        GameObject go = new GameObject();
        Debug.Log(go.transform.GetChild(0));
        //gameObject.activeInHierarchy

        //gameObject.GetComponent<Button>().onClick

        //      button = transform.Find("Button").GetComponent<Button>();
        //image = transform.Find("Image").GetComponent<Image>();

        //EventTriggerListener.Get(image.gameObject).onClick =OnButtonClick;

        EventTriggerListener.Get(gameObject).onClick = OnButtonClick;
        //gameObject.transform.childCount
        //gameObject.transform.GetChild(0);
        //gameObject.GetComponent<RectTransform>().sizeDelta.x 
    }




    private void OnButtonClick(GameObject go)
    {
        //在这里监听按钮的点击事件
        
            Debug.Log("DoSomeThings");
        
    }
	
}
