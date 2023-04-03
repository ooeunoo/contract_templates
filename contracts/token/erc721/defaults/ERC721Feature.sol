// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

abstract contract ERC721Feature {
  string public v = "ERC721v1";

  enum FeatureType {
    PAUSABLE,
    BURNABLE,
    FREEZABLE,
    AUTO_INCREMENT_ID
  }

  enum Access {
    NONE,
    OWNABLE,
    ROLES
  }

  struct Features {
    bool pausable;
    bool burnable;
    bool freezable;
    bool autoIncrementId;
  }

  Features public features;
  Access public access;

  function _setFeatures(FeatureType[] memory _featureType)
    internal
    returns (bool)
  {
    Features memory _features = Features({
      pausable: false,
      burnable: false,
      freezable: false,
      autoIncrementId: false
    });

    for (uint256 i = 0; i < _featureType.length; i++) {
      if (_featureType[i] == FeatureType.PAUSABLE) {
        _features.pausable = true;
      } else if (_featureType[i] == FeatureType.BURNABLE) {
        _features.burnable = true;
      } else if (_featureType[i] == FeatureType.FREEZABLE) {
        _features.freezable = true;
      } else if (_featureType[i] == FeatureType.AUTO_INCREMENT_ID) {
        _features.autoIncrementId = true;
      }
    }

    features = _features;
    return true;
  }

  function _setAccess(Access _access) internal returns (bool) {
    access = _access;
    return true;
  }
}
