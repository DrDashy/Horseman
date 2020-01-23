/*
 * Create a timer
 * m_begin : time where the timer start
 * m_duration : duration of the timer (in milliseconds)
 * m_time : actual time of the timer
 * m_isActive : boolean to know if the timer is working
 */
public class Timer {
  
    private int m_begin; 
    private int m_duration;
    private int m_time;
    private boolean m_isActive;
    
    /* Constructor - setDuration in seconds */
    Timer(int setDuration) {
        m_isActive = false;
        m_duration = setDuration * 1000;
        m_time = 0;
    }
    
    public void setTimer() {
        m_time = m_duration;
        m_begin = millis();
        m_isActive = true;
    }
    
    public boolean isWorking() {
        return m_isActive;
    }
    
    public void draw() {        
        if (m_time > 0){ 
            m_time = m_duration - (millis() - m_begin);
        } else {
            m_isActive = false; 
        }
    }
  
}
