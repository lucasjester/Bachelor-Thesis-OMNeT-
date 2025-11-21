package com.omnetpp.omnetpp_plugin;

import com.intellij.psi.tree.TokenSet;
import com.omnetpp.omnetpp_plugin.psi.NedTypes;

public interface NedTokenSets {

    TokenSet COMMENTS = TokenSet.EMPTY;
    TokenSet STRINGS = TokenSet.create(NedTypes.STRINGCONSTANT);
}
