package com.omnetpp.omnetpp_plugin.psi;

import com.intellij.psi.tree.IElementType;
import com.omnetpp.omnetpp_plugin.NedLanguage;
import org.jetbrains.annotations.NonNls;
import org.jetbrains.annotations.NotNull;

public class NedElementType extends IElementType {
    public NedElementType(@NotNull @NonNls String debugName) {
        super(debugName, NedLanguage.INSTANCE);
    }
}

