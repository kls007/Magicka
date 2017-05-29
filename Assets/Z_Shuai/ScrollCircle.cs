using UnityEngine;
using System.Collections;
using UnityEngine.UI;
using UnityEngine.EventSystems;
using System;

public class ScrollCircle : ScrollRect, IBeginDragHandler, IEndDragHandler
{
    GameObject target;
    Animator ac;
    float speedX;
    float speedZ;
    bool isDrag = false;
    Vector2 centerPoint = Vector2.zero;
    Vector2 currentDelta = Vector2.zero;
    public float speed = 10f;
    protected float mRadius = 0f;
    

    protected override void Start()
    {
        base.Start();
        //计算摇杆块的半径
        mRadius = (transform as RectTransform).sizeDelta.x * 0.5f;
        
        Debug.Log("mRadius -- " + mRadius);

        MoveTest moveTest = gameObject.GetComponent<MoveTest>();
        target = moveTest.target;
        speedX = moveTest.speedX;
        speedZ = moveTest.speedZ;

        ac = target.GetComponent<Animator>();
    }

    void MoveC(Vector3 dir)
    {
        Vector3 newV = dir;
        target.transform.forward = Vector3.Lerp(target.transform.forward, newV, Time.deltaTime * 4);
        target.transform.position = target.transform.position + target.transform.forward * Time.deltaTime * speed;
        ac.SetFloat("speed", 1f);
    }

    private void Update()
    {
        if (Input.GetKey(KeyCode.UpArrow))
        {
            MoveC(Vector3.forward);
            return;
        }
        else if (Input.GetKey(KeyCode.DownArrow))
        {
            MoveC(Vector3.back);
            return;
        }
        else if (Input.GetKey(KeyCode.LeftArrow))
        {
            MoveC(Vector3.left);
            return;
        }
        else if (Input.GetKey(KeyCode.RightArrow))
        {
            MoveC(Vector3.right);
            return;
        }

        if (isDrag)
        {
           
            Vector3 newV = new Vector3(content.anchoredPosition.x, 0, content.anchoredPosition.y);
            target.transform.forward = Vector3.Lerp(target.transform.forward, newV, Time.deltaTime * 4);
            target.transform.position = target.transform.position + target.transform.forward * Time.deltaTime * speed;

            
            float s = Math.Abs(content.anchoredPosition.x) + Math.Abs(content.anchoredPosition.y);
            ac.SetFloat("speed", 2f);
            
        }
        else
        {
            ac.SetFloat("speed", 0f);
        }

    }
    public override void OnBeginDrag(PointerEventData eventData)
    {
        base.OnBeginDrag(eventData);
        //print(eventData);

        currentDelta = eventData.delta;
        isDrag = true;
    }
    public override void OnEndDrag(PointerEventData eventData)
    {
        base.OnEndDrag(eventData);
        //print(eventData);

        currentDelta = Vector2.zero;
        isDrag = false;
        
    }


    public override void OnDrag(PointerEventData eventData)
    {
        
        base.OnDrag(eventData);
        var contentPostion = this.content.anchoredPosition;
        if (contentPostion.magnitude > mRadius)
        {
            contentPostion = contentPostion.normalized * mRadius;
            SetContentAnchoredPosition(contentPostion);
        }

        //print(eventData);
        //print(this.content);
        //print(contentPostion);
        currentDelta = eventData.delta;

        
    }

   
}
