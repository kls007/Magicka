using UnityEngine;
using System.Collections;

public class HPSliderControl : MonoBehaviour
{
    Transform target;
    void Awake()
    {
        target = GameObject.FindWithTag("GuiCamera").transform;
    }
    void LateUpdate () {
        transform.rotation = target.rotation; //Camera.main.transform.rotation;
	}
}