using System.Collections;
using System.Collections.Generic;
using Unity.VisualScripting;
using UnityEngine;
using UnityEngine.XR.ARFoundation;
using UnityEngine.XR.ARSubsystems;

public class SpawnObjectPlane : MonoBehaviour
{
    [SerializeField]
    [Tooltip("Instantiates this prefab on a plane at the touch location.")]
    GameObject placedPrefab;

    /// <summary>
    /// The instiantiated object.
    /// </summary>
    GameObject spawnedObject;

    ARRaycastManager aRRaycastManager;
    List<ARRaycastHit> hits = new List<ARRaycastHit>();

    private void Awake() {
        aRRaycastManager = GetComponent<ARRaycastManager>();
    }

    private void Update() {
        // Check if there is existing touch.
        if (Input.touchCount == 0) {
            return;
        } 

        // Check if the raycast hit any trackables.
        if (aRRaycastManager.Raycast(Input.GetTouch(0).position, hits, TrackableType.PlaneWithinPolygon)) {
            // Raycast hits are sorted by distance, so the first hit means the closest.
            var hitPose = hits[0].pose;

            // Check if there is already spawned objct. If there is none, instantiated the prefab.
            if (spawnedObject == null) {
                spawnedObject = Instantiate(placedPrefab, hitPose.position,
                    placedPrefab.gameObject.transform.rotation); 
            } else {
                // Change the spawned object position and rotation to the touch position.
                spawnedObject.transform.position = hitPose.position;
                spawnedObject.transform.rotation = placedPrefab.gameObject.transform.rotation;
            }
        }
    }
}
