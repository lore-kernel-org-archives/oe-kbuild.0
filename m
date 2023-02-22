Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F43A92D
	for <oe-kbuild@lists.linux.dev>; Wed, 22 Feb 2023 21:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677102998; x=1708638998;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VvDp/4Xzk0qThVfGshx2s6SvMlkd8wHjylp1qvnfpF0=;
  b=HAHxxVZ7TVYGQaZV/WQQgfYTl5DzKEDp4kQh3WIt7TMc76n+CmvOt2G0
   3h+xdsDhRQYPUL+RaG5UkFqnefADVYc59pZvSBUR1z//jgjv9Wx8R24lU
   YhjhZt/MzN8guRrdvZaTuHiGELUv7n8ZEEyYSUSWEi8qgpEceD3eydl7O
   gyJ0hPkqYZH2lsXyyyH/Vsw1gSgPhJ06CxhC2tm+tETRpt0+8gQWpVxEl
   D3b/anlynKXit1jn8ih0DN1CGtlA6OKxLJdjjXUZBzrclC2O3P5jObI2l
   QM5wdX8XcW2fJGcC5/JglRVFIeRdfTqzGl43nHUVYcr0NFnerqCpkk2oG
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="331715284"
X-IronPort-AV: E=Sophos;i="5.97,319,1669104000"; 
   d="scan'208";a="331715284"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2023 13:56:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="622094591"
X-IronPort-AV: E=Sophos;i="5.97,319,1669104000"; 
   d="scan'208";a="622094591"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 22 Feb 2023 13:56:33 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pUx6G-0000l5-37;
	Wed, 22 Feb 2023 21:56:32 +0000
Date: Thu, 23 Feb 2023 05:56:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android13-5.15-2023-01 2601/16422] undefined
 reference to `phy_disconnect'
Message-ID: <202302230559.F1LeNTeX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: (.text+0x614): undefined reference to `phy_disconnect'"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

Hi Chanho,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android13-5.15-2023-01
head:   827c689fc2059484f5052cca1080ffb375e87d02
commit: 9c2efcb127bb2168f3f523892a41b969ee3070ce [2601/16422] ANDROID: GKI: Kconfig.gki: Add GKI_HIDDEN_ETHERNET_CONFIGS
:::::: branch date: 8 hours ago
:::::: commit date: 1 year, 8 months ago
config: arm-randconfig-s031-20230221 (https://download.01.org/0day-ci/archive/20230223/202302230559.F1LeNTeX-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android13-5.15-2023-01
        git checkout 9c2efcb127bb2168f3f523892a41b969ee3070ce
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202302230559.F1LeNTeX-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: lib/decompress_unlz4.o: in function `unlz4':
   decompress_unlz4.c:(.init.text+0x434): undefined reference to `LZ4_decompress_safe'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_get_fixed_state':
   phylink.c:(.text+0x224): undefined reference to `linkmode_resolve_pause'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_disconnect_phy':
>> (.text+0x614): undefined reference to `phy_disconnect'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_wol':
>> (.text+0x6d8): undefined reference to `phy_ethtool_get_wol'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_wol':
>> (.text+0x790): undefined reference to `phy_ethtool_set_wol'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_ksettings_get':
>> (.text+0x908): undefined reference to `phy_ethtool_ksettings_get'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_get_eee_err':
>> (.text+0xa6c): undefined reference to `phy_get_eee_err'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_init_eee':
>> (.text+0xb08): undefined reference to `phy_init_eee'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_eee':
>> (.text+0xb78): undefined reference to `phy_ethtool_get_eee'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_eee':
>> (.text+0xc40): undefined reference to `phy_ethtool_set_eee'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_set_advertisement':
>> (.text+0xd58): undefined reference to `mdiobus_read'
>> arm-linux-gnueabi-ld: (.text+0xdb0): undefined reference to `mdiobus_read'
>> arm-linux-gnueabi-ld: (.text+0xdf8): undefined reference to `mdiobus_write'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_an_restart':
   (.text+0xe54): undefined reference to `mdiobus_read'
   arm-linux-gnueabi-ld: (.text+0xe88): undefined reference to `mdiobus_write'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_mii_emul_read':
   phylink.c:(.text+0xeec): undefined reference to `swphy_read_reg'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_mii_ioctl':
>> (.text+0xfe4): undefined reference to `phy_mii_ioctl'
   arm-linux-gnueabi-ld: (.text+0x10d8): undefined reference to `mdiobus_read'
   arm-linux-gnueabi-ld: (.text+0x1394): undefined reference to `mdiobus_write'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_speed_down':
>> (.text+0x1508): undefined reference to `phy_speed_down'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_config':
>> (.text+0x15f4): undefined reference to `mdiobus_modify'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_pauseparam':
>> (.text+0x1cb0): undefined reference to `linkmode_set_pause'
>> arm-linux-gnueabi-ld: (.text+0x1d3c): undefined reference to `phy_set_asym_pause'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c45_pcs_get_state':
   (.text+0x1f14): undefined reference to `mdiobus_read'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_speed_up':
>> (.text+0x2038): undefined reference to `phy_speed_up'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_stop':
>> (.text+0x20f0): undefined reference to `phy_stop'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_decode_c37_word':
   phylink.c:(.text+0x2380): undefined reference to `linkmode_resolve_pause'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_get_state':
   (.text+0x2438): undefined reference to `mdiobus_read'
   arm-linux-gnueabi-ld: (.text+0x244c): undefined reference to `mdiobus_read'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_ksettings_set':
>> (.text+0x2808): undefined reference to `phy_ethtool_ksettings_set'
>> arm-linux-gnueabi-ld: (.text+0x2918): undefined reference to `phy_lookup_setting'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_phy_change':
   phylink.c:(.text+0x2c84): undefined reference to `phy_get_pause'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_start':
   (.text+0x2e80): undefined reference to `phy_start'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_resolve':
   phylink.c:(.text+0x3708): undefined reference to `phy_speed_to_str'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x3710): undefined reference to `phy_duplex_to_str'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x377c): undefined reference to `phy_speed_to_str'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x378c): undefined reference to `phy_duplex_to_str'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_bringup_phy':
   phylink.c:(.text+0x3850): undefined reference to `phy_support_asym_pause'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x3958): undefined reference to `phy_attached_info_irq'
   arm-linux-gnueabi-ld: phylink.c:(.text+0x3a7c): undefined reference to `phy_request_interrupt'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_connect_phy':
   (.text+0x3c00): undefined reference to `phy_attach_direct'
   arm-linux-gnueabi-ld: (.text+0x3c9c): undefined reference to `phy_detach'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_parse_fixedlink':
   phylink.c:(.text+0x434c): undefined reference to `phy_lookup_setting'
   arm-linux-gnueabi-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_nway_reset':
   (.text+0x4934): undefined reference to `phy_restart_aneg'
   arm-linux-gnueabi-ld: net/socket.o: in function `sock_ioctl':
   socket.c:(.text+0x312c): undefined reference to `wext_handle_ioctl'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=y] && WIRELESS [=n] && PROC_FS [=n] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=y] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=y] && !UML && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
