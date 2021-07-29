using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;



   

    public class ChangeParameter : MonoBehaviour
    {

    private Renderer rend;
    public float tweak;
    

    // Start is called before the first frame update
    void Start()
        {
           
            rend = GetComponent<Renderer>();
        }

        // Update is called once per frame
        void Update()
        {
            rend.material.SetFloat("_Final_Illumination_Power", tweak); // whatever parameter you wish to edit, use the name from the shader parameters list by clicking on the shader and editing the parameter.
        }
    }



