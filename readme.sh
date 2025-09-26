# 🎶 SONG RECOMMENDATION SYSTEM BY EMOTION DETECTION

I’ll give you the **project idea, workflow, dataset options, tools, and sample code** so you can implement it step by step.

---

## 📌 Project Overview

This system detects the **emotion of a person** (through text, voice, or image) and recommends a **playlist of songs** that match the mood.
Example:

* If emotion = *Happy* → Recommend upbeat songs.
* If emotion = *Sad* → Recommend calm/soothing songs.
* If emotion = *Angry* → Recommend energetic/rock songs.

---

## 🔄 Workflow

1. **Input Emotion Detection**

   * Method 1: Face Detection (using CNN or OpenCV + DeepFace)
   * Method 2: Text Sentiment Analysis (using NLP)
   * Method 3: Voice Emotion Recognition (optional)

2. **Classify Emotion**

   * Emotions: *Happy, Sad, Angry, Neutral, Fear, Surprise*

3. **Song Database**

   * Store songs (Spotify/Youtube links or local MP3) mapped to emotions.
   * Example:

     ```json
     {
       "Happy": ["song1", "song2"],
       "Sad": ["song3", "song4"],
       "Angry": ["song5", "song6"]
     }
     ```

4. **Recommendation Engine**

   * Based on detected emotion → Fetch songs from the database.

5. **Output**

   * Display song recommendations or auto-play them.

---

## 🛠 Tools & Libraries

* **Python** (core language)
* **Libraries**:

  * `opencv-python` (image/video capture)
  * `deepface` (emotion recognition)
  * `textblob` / `transformers` (NLP for text emotions)
  * `pandas` (song dataset handling)
  * `streamlit` / `tkinter` (GUI for user interface)

---

## 📂 Dataset Sources

* Emotion datasets: [FER2013 (facial emotions)](https://www.kaggle.com/datasets/msambare/fer2013)
* Song dataset: Create your own CSV with columns:

  ```
  Song, Artist, Emotion, Link
  ```

---

## 🧑‍💻 Sample Python Code (Face + Song Recommendation)

```python
import cv2
from deepface import DeepFace
import random
import pandas as pd

# Step 1: Song Database
songs = {
    "happy": ["Happy - Pharrell", "Uptown Funk - Bruno Mars"],
    "sad": ["Someone Like You - Adele", "Let Her Go - Passenger"],
    "angry": ["Numb - Linkin Park", "Smells Like Teen Spirit - Nirvana"],
    "neutral": ["Shape of You - Ed Sheeran", "Perfect - Ed Sheeran"],
    "surprise": ["Thunderstruck - AC/DC", "Happy - Pharrell"],
    "fear": ["Lose Yourself - Eminem", "Believer - Imagine Dragons"]
}

# Step 2: Capture Image
cam = cv2.VideoCapture(0)
ret, frame = cam.read()
cv2.imwrite("test.jpg", frame)
cam.release()

# Step 3: Detect Emotion
result = DeepFace.analyze(img_path = "test.jpg", actions = ['emotion'])
emotion = result['dominant_emotion']
print("Detected Emotion:", emotion)

# Step 4: Recommend Song
if emotion in songs:
    recommended = random.choice(songs[emotion])
else:
    recommended = random.choice(songs["neutral"])

print("Recommended Song:", recommended)
```

---

## 🎨 Possible Extensions

* Build a **Streamlit Web App** with an upload option.
* Integrate **Spotify API** to play songs automatically.
* Add **Voice Emotion Detection**.
* Allow user feedback to improve recommendations.

---

👉 Do you want me to make this as a **full project report (with Abstract, Objectives, Methodology, Results, Conclusion, and Future Scope)** for submission, or just the **working code version**?
