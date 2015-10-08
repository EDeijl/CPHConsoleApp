package org.haskell;

import android.app.Activity;
import android.os.Bundle;

public class HaskellActivity extends Activity
{
    @Override
    public void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        helloWorld();
    }

    public native void helloWorld();
    static { System.loadLibrary("CPConsoleApp"); }
}
