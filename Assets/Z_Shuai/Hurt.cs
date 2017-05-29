using UnityEngine;
using System.Collections;
using UnityEngine.UI;

public class Hurt : MonoBehaviour {

    Slider hpSlider;
    float max_hp = 100;
    float current_hp = 100;
    
	void Awake () {
        hpSlider = gameObject.GetComponentInChildren<Slider>();
    }

    public void Show(float damage)
    {
        current_hp -= damage;
        hpSlider.value = current_hp / max_hp * hpSlider.maxValue;
        
    }

    // Update is called once per frame
    void Update () {
	
	}
}
