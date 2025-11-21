package com.omnetpp.omnetpp_plugin;

import com.intellij.lang.Language;

public class NedLanguage extends Language {
    public static final NedLanguage INSTANCE = new NedLanguage();

    private NedLanguage() {
        super("NED");
    }
}
