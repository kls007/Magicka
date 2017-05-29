using UnityEngine;
using System.Collections;
using UnityEngine.UI;

public class PlayerAttack : MonoBehaviour {

    CapsuleCollider collider;
    Rigidbody rigidbody;

    void Awake () {
        collider = transform.GetComponent<CapsuleCollider>();
        rigidbody = transform.GetComponent<Rigidbody>();
    }

    void OnCollisionEnter(Collision collision)
    {
        
        if(collision.gameObject.tag == "Enemy")
        {
            Debug.Log(collision.gameObject);
           

            Hurt hurt = collision.gameObject.GetComponentInChildren<Hurt>();
            hurt.Show(20);
        }
    }

    void OnCollisionStay(Collision collision)
    {
        if (Input.GetKeyDown(KeyCode.A))
        {
            Debug.Log("Attack");
        }
    }

    void Update () {
        if (Input.GetKeyDown(KeyCode.A))
        {
            Debug.Log("Attack");
            rigidbody.AddExplosionForce(1000f, transform.position, 10000f);
            //rigidbody.AddExplosionForce


        }
    }
}
