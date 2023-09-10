Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6091A1377
	for <oe-kbuild@lists.linux.dev>; Sun, 10 Sep 2023 02:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694312539; x=1725848539;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/dfm1hqwCxMScR5Wa1mDLUdcw6APyNSsEHEnqlI2kJw=;
  b=ekYa+056qlzty6LwLp9W4MdGnJeCB3+Y6dbeJ0NNKotJ+f5Kb6PO97rv
   b8QgabvNEglw6bTFVUFqGY9ppW33CFKNSQkJMU9A0Ok3BKbBDxNqhul6a
   KN4UpyiZq6qsNlMVjYCTJI11dNMe9CqjroZuwc4EKTpXHn1QyoiFjA79C
   60Jbi1synMg8xcHqcxqMEk3fPcmOSJ90CUL1GaR684K3XzExa1eOtE+Ii
   A3+Y4oHPEk0GsYzpOu8QWJa9hPIN1Q/QvXe6ZJ4Oy+DC8AajIH+9fdIQt
   lJUdDNDyOjUrE2HHvpfXtB6EE5u6/Qydx8fsKq7wf9fg9jSaTeM8oS3U1
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="464228126"
X-IronPort-AV: E=Sophos;i="6.02,240,1688454000"; 
   d="scan'208";a="464228126"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2023 19:22:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="886067444"
X-IronPort-AV: E=Sophos;i="6.02,240,1688454000"; 
   d="scan'208";a="886067444"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 09 Sep 2023 19:21:56 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qfA5W-0004Ea-10;
	Sun, 10 Sep 2023 02:22:14 +0000
Date: Sun, 10 Sep 2023 10:22:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jcmvbkbc-xtensa:xtensa-6.5-esp32 17/36] checkpatch: WARNING:
 LINUX_VERSION_CODE should be avoided, code should be for the version to
 which it is merged
Message-ID: <202309101000.cJ3wHjIe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "checkpatch"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Max Filippov <jcmvbkbc@gmail.com>
INFO skip CC for checkpatch warnings

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.5-esp32
head:   6497b8ba138880f5f4a44ec7315b57ccaca7200c
commit: 3ab13b9157d2dbb251e6373b4c429e60a4a663d3 [17/36] drivers/net/wireless/espressif/esp32-ng: initial import
:::::: branch date: 3 hours ago
:::::: commit date: 11 days ago
reproduce: (https://download.01.org/0day-ci/archive/20230910/202309101000.cJ3wHjIe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309101000.cJ3wHjIe-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
#93: 
new file mode 100644

WARNING: please write a help paragraph that fully describes the config symbol
#130: drivers/net/wireless/espressif/esp32-ng/Kconfig:3:
+config ESP32_WIFI
+	tristate "Espressif esp32/esp32sx/esp32cx devices"
+	depends on CFG80211
+	select WIRELESS_EXT
+	select CRYPTO
+	select CRYPTO_SKCIPHER
+	select WEXT_SPY
+	select WEXT_PRIV
+	help
+	  This is the standard Linux driver to support esp32 family of devices.
+

WARNING: Missing or malformed SPDX-License-Identifier tag in line 1
#163: drivers/net/wireless/espressif/esp32-ng/adapter.h:1:
+// Copyright 2015-2021 Espressif Systems (Shanghai) PTE LTD

WARNING: Misplaced SPDX-License-Identifier tag - use line 1 instead
#164: drivers/net/wireless/espressif/esp32-ng/adapter.h:2:
+/* SPDX-License-Identifier: GPL-2.0-only OR Apache-2.0 */

CHECK: Prefer using the BIT macro
#179: drivers/net/wireless/espressif/esp32-ng/adapter.h:17:
+#define MORE_FRAGMENT                   (1 << 0)

CHECK: Prefer kernel type 'u8' over 'uint8_t'
#187: drivers/net/wireless/espressif/esp32-ng/adapter.h:25:
+	uint8_t          flags;

CHECK: Prefer kernel type 'u8' over 'uint8_t'
#188: drivers/net/wireless/espressif/esp32-ng/adapter.h:26:
+	uint8_t          packet_type;

CHECK: Prefer kernel type 'u8' over 'uint8_t'
#189: drivers/net/wireless/espressif/esp32-ng/adapter.h:27:
+	uint8_t          reserved1;

CHECK: Prefer kernel type 'u16' over 'uint16_t'
#190: drivers/net/wireless/espressif/esp32-ng/adapter.h:28:
+	uint16_t         len;

CHECK: Prefer kernel type 'u16' over 'uint16_t'
#191: drivers/net/wireless/espressif/esp32-ng/adapter.h:29:
+	uint16_t         offset;

CHECK: Prefer kernel type 'u16' over 'uint16_t'
#192: drivers/net/wireless/espressif/esp32-ng/adapter.h:30:
+	uint16_t         checksum;

CHECK: Prefer kernel type 'u8' over 'uint8_t'
#193: drivers/net/wireless/espressif/esp32-ng/adapter.h:31:
+	uint8_t          reserved2;

WARNING: Block comments use a trailing */ on a separate line
#195: drivers/net/wireless/espressif/esp32-ng/adapter.h:33:
+	 * this is required for hci_pkt_type */

CHECK: Prefer kernel type 'u8' over 'uint8_t'
#197: drivers/net/wireless/espressif/esp32-ng/adapter.h:35:
+		uint8_t      reserved3;

CHECK: Prefer kernel type 'u8' over 'uint8_t'
#198: drivers/net/wireless/espressif/esp32-ng/adapter.h:36:
+		uint8_t      hci_pkt_type;    /* Packet type for HCI interface */

CHECK: Prefer kernel type 'u8' over 'uint8_t'
#199: drivers/net/wireless/espressif/esp32-ng/adapter.h:37:
+		uint8_t      priv_pkt_type;   /* Packet type for priv interface */

CHECK: Prefer kernel type 'u16' over 'uint16_t'
#205: drivers/net/wireless/espressif/esp32-ng/adapter.h:43:
+	uint16_t   frame_control;

CHECK: Prefer kernel type 'u16' over 'uint16_t'
#206: drivers/net/wireless/espressif/esp32-ng/adapter.h:44:
+	uint16_t   dur;

CHECK: Prefer kernel type 'u8' over 'uint8_t'
#207: drivers/net/wireless/espressif/esp32-ng/adapter.h:45:
+	uint8_t    da[MAC_ADDR_LEN];

CHECK: Prefer kernel type 'u8' over 'uint8_t'
#208: drivers/net/wireless/espressif/esp32-ng/adapter.h:46:
+	uint8_t    sa[MAC_ADDR_LEN];

CHECK: Prefer kernel type 'u8' over 'uint8_t'
#209: drivers/net/wireless/espressif/esp32-ng/adapter.h:47:
+	uint8_t    bssid[MAC_ADDR_LEN];

CHECK: Prefer kernel type 'u16' over 'uint16_t'
#210: drivers/net/wireless/espressif/esp32-ng/adapter.h:48:
+	uint16_t   seq_ctrl;

WARNING: do not add new typedefs
#249: drivers/net/wireless/espressif/esp32-ng/adapter.h:87:
+typedef enum {

CHECK: Prefer kernel type 'u8' over 'uint8_t'
#306: drivers/net/wireless/espressif/esp32-ng/adapter.h:144:
+	uint8_t    cmd_code;

CHECK: Prefer kernel type 'u8' over 'uint8_t'
#307: drivers/net/wireless/espressif/esp32-ng/adapter.h:145:
+	uint8_t    cmd_status;

CHECK: Prefer kernel type 'u16' over 'uint16_t'
#308: drivers/net/wireless/espressif/esp32-ng/adapter.h:146:
+	uint16_t   len;

CHECK: Prefer kernel type 'u16' over 'uint16_t'
#309: drivers/net/wireless/espressif/esp32-ng/adapter.h:147:
+	uint16_t   seq_num;

CHECK: Prefer kernel type 'u8' over 'uint8_t'
#310: drivers/net/wireless/espressif/esp32-ng/adapter.h:148:
+	uint8_t    reserved1;

CHECK: Prefer kernel type 'u8' over 'uint8_t'
#311: drivers/net/wireless/espressif/esp32-ng/adapter.h:149:
+	uint8_t    reserved2;

CHECK: Prefer kernel type 'u8' over 'uint8_t'
#316: drivers/net/wireless/espressif/esp32-ng/adapter.h:154:
+	uint8_t    bssid[MAC_ADDR_LEN];

CHECK: Prefer kernel type 'u16' over 'uint16_t'
#317: drivers/net/wireless/espressif/esp32-ng/adapter.h:155:
+	uint16_t   duration;

CHECK: spaces preferred around that '+' (ctx:VxV)
#318: drivers/net/wireless/espressif/esp32-ng/adapter.h:156:
+	char       ssid[MAX_SSID_LEN+1];
 	                            ^

CHECK: Prefer kernel type 'u8' over 'uint8_t'
#319: drivers/net/wireless/espressif/esp32-ng/adapter.h:157:
+	uint8_t    channel;

CHECK: Prefer kernel type 'u8' over 'uint8_t'
#320: drivers/net/wireless/espressif/esp32-ng/adapter.h:158:
+	uint8_t    pad[2];

CHECK: Prefer kernel type 'u8' over 'uint8_t'
#325: drivers/net/wireless/espressif/esp32-ng/adapter.h:163:
+	uint8_t    mac_addr[MAC_ADDR_LEN];

CHECK: Prefer kernel type 'u8' over 'uint8_t'
#326: drivers/net/wireless/espressif/esp32-ng/adapter.h:164:
+	uint8_t    pad[2];

CHECK: Prefer kernel type 'u8' over 'uint8_t'
#331: drivers/net/wireless/espressif/esp32-ng/adapter.h:169:
+	uint8_t    bssid[MAC_ADDR_LEN];

CHECK: Prefer kernel type 'u8' over 'uint8_t'
#332: drivers/net/wireless/espressif/esp32-ng/adapter.h:170:
+	uint8_t    channel;

CHECK: Prefer kernel type 'u8' over 'uint8_t'
#333: drivers/net/wireless/espressif/esp32-ng/adapter.h:171:
+	uint8_t    auth_type;

CHECK: spaces preferred around that '+' (ctx:VxV)
#334: drivers/net/wireless/espressif/esp32-ng/adapter.h:172:
+	char       ssid[MAX_SSID_LEN+1];
 	                            ^

CHECK: Prefer kernel type 'u8' over 'uint8_t'
#335: drivers/net/wireless/espressif/esp32-ng/adapter.h:173:
+	uint8_t    auth_data_len;

CHECK: Prefer kernel type 'u8' over 'uint8_t'
#336: drivers/net/wireless/espressif/esp32-ng/adapter.h:174:
+	uint8_t    pad[2];

CHECK: Prefer kernel type 'u8' over 'uint8_t'
#337: drivers/net/wireless/espressif/esp32-ng/adapter.h:175:
+	uint8_t    auth_data[];

CHECK: Prefer kernel type 'u8' over 'uint8_t'
#342: drivers/net/wireless/espressif/esp32-ng/adapter.h:180:
+	uint8_t    assoc_ie_len;

CHECK: Prefer kernel type 'u8' over 'uint8_t'
#343: drivers/net/wireless/espressif/esp32-ng/adapter.h:181:
+	uint8_t    pad[3];

CHECK: Prefer kernel type 'u8' over 'uint8_t'
#344: drivers/net/wireless/espressif/esp32-ng/adapter.h:182:
+	uint8_t    assoc_ie[];

CHECK: Prefer kernel type 'u8' over 'uint8_t'
#349: drivers/net/wireless/espressif/esp32-ng/adapter.h:187:
+	uint8_t    bssid[MAC_ADDR_LEN];

CHECK: Prefer kernel type 'u16' over 'uint16_t'
#350: drivers/net/wireless/espressif/esp32-ng/adapter.h:188:
+	uint16_t   assoc_flags;

CHECK: spaces preferred around that '+' (ctx:VxV)
#351: drivers/net/wireless/espressif/esp32-ng/adapter.h:189:
+	char       ssid[MAX_SSID_LEN+1];
 	                            ^

CHECK: Prefer kernel type 'u8' over 'uint8_t'
#352: drivers/net/wireless/espressif/esp32-ng/adapter.h:190:
+	uint8_t    channel;

CHECK: Prefer kernel type 'u8' over 'uint8_t'
#353: drivers/net/wireless/espressif/esp32-ng/adapter.h:191:
+	uint8_t    is_auth_open;

CHECK: Prefer kernel type 'u8' over 'uint8_t'
#354: drivers/net/wireless/espressif/esp32-ng/adapter.h:192:
+	uint8_t    assoc_ie_len;

CHECK: Prefer kernel type 'u8' over 'uint8_t'
#355: drivers/net/wireless/espressif/esp32-ng/adapter.h:193:
+	uint8_t    assoc_ie[];

CHECK: Prefer kernel type 'u16' over 'uint16_t'
#360: drivers/net/wireless/espressif/esp32-ng/adapter.h:198:
+	uint16_t   reason_code;

CHECK: Prefer kernel type 'u8' over 'uint8_t'
#361: drivers/net/wireless/espressif/esp32-ng/adapter.h:199:
+	uint8_t    pad[2];

CHECK: Prefer kernel type 'u32' over 'uint32_t'
#366: drivers/net/wireless/espressif/esp32-ng/adapter.h:204:
+	uint32_t ip;

CHECK: Prefer kernel type 'u8' over 'uint8_t'
#371: drivers/net/wireless/espressif/esp32-ng/adapter.h:209:
+	uint8_t count;

CHECK: Prefer kernel type 'u8' over 'uint8_t'
#372: drivers/net/wireless/espressif/esp32-ng/adapter.h:210:
+	uint8_t mcast_addr[MAX_MULTICAST_ADDR_COUNT][MAC_ADDR_LEN];

CHECK: Prefer kernel type 'u32' over 'uint32_t'
#376: drivers/net/wireless/espressif/esp32-ng/adapter.h:214:
+	uint32_t   algo;

CHECK: Prefer kernel type 'u32' over 'uint32_t'
#377: drivers/net/wireless/espressif/esp32-ng/adapter.h:215:
+	uint32_t   index;

CHECK: Prefer kernel type 'u8' over 'uint8_t'
#378: drivers/net/wireless/espressif/esp32-ng/adapter.h:216:
+	uint8_t    data[MAX_KEY_LEN];

CHECK: Prefer kernel type 'u32' over 'uint32_t'
#379: drivers/net/wireless/espressif/esp32-ng/adapter.h:217:
+	uint32_t   len;

CHECK: Prefer kernel type 'u8' over 'uint8_t'
#380: drivers/net/wireless/espressif/esp32-ng/adapter.h:218:
+	uint8_t    mac_addr[MAC_ADDR_LEN];

CHECK: Prefer kernel type 'u8' over 'uint8_t'
#381: drivers/net/wireless/espressif/esp32-ng/adapter.h:219:
+	uint8_t    seq[MAX_SEQ_LEN];

CHECK: Prefer kernel type 'u32' over 'uint32_t'
#382: drivers/net/wireless/espressif/esp32-ng/adapter.h:220:
+	uint32_t   seq_len;

CHECK: Prefer kernel type 'u8' over 'uint8_t'
#383: drivers/net/wireless/espressif/esp32-ng/adapter.h:221:
+	uint8_t    del;

CHECK: Prefer kernel type 'u8' over 'uint8_t'
#384: drivers/net/wireless/espressif/esp32-ng/adapter.h:222:
+	uint8_t    set_cur;

CHECK: Prefer kernel type 'u8' over 'uint8_t'
#385: drivers/net/wireless/espressif/esp32-ng/adapter.h:223:
+	uint8_t    pad[2];

CHECK: Prefer kernel type 'u32' over 'uint32_t'
#390: drivers/net/wireless/espressif/esp32-ng/adapter.h:228:
+	uint32_t   value;

CHECK: Prefer kernel type 'u8' over 'uint8_t'
#404: drivers/net/wireless/espressif/esp32-ng/adapter.h:242:
+	uint8_t    event_code;

CHECK: Prefer kernel type 'u8' over 'uint8_t'
#405: drivers/net/wireless/espressif/esp32-ng/adapter.h:243:
+	uint8_t    status;

CHECK: Prefer kernel type 'u16' over 'uint16_t'
#406: drivers/net/wireless/espressif/esp32-ng/adapter.h:244:
+	uint16_t   len;

CHECK: Prefer kernel type 'u8' over 'uint8_t'
#411: drivers/net/wireless/espressif/esp32-ng/adapter.h:249:
+	uint8_t    bssid[MAC_ADDR_LEN];

CHECK: Prefer kernel type 'u8' over 'uint8_t'
#412: drivers/net/wireless/espressif/esp32-ng/adapter.h:250:
+	uint8_t    frame_type;

CHECK: Prefer kernel type 'u8' over 'uint8_t'
#413: drivers/net/wireless/espressif/esp32-ng/adapter.h:251:
+	uint8_t    channel;

CHECK: Prefer kernel type 'u32' over 'uint32_t'
#414: drivers/net/wireless/espressif/esp32-ng/adapter.h:252:
+	uint32_t   rssi;

CHECK: Prefer kernel type 'u64' over 'uint64_t'
#415: drivers/net/wireless/espressif/esp32-ng/adapter.h:253:
+	uint64_t   tsf;

CHECK: Prefer kernel type 'u16' over 'uint16_t'
#416: drivers/net/wireless/espressif/esp32-ng/adapter.h:254:
+	uint16_t   frame_len;

CHECK: Prefer kernel type 'u8' over 'uint8_t'
#417: drivers/net/wireless/espressif/esp32-ng/adapter.h:255:
+	uint8_t    pad[2];

CHECK: Prefer kernel type 'u8' over 'uint8_t'
#418: drivers/net/wireless/espressif/esp32-ng/adapter.h:256:
+	uint8_t    frame[0];

ERROR: Use C99 flexible arrays - see https://docs.kernel.org/process/deprecated.html#zero-length-and-one-element-arrays
#419: drivers/net/wireless/espressif/esp32-ng/adapter.h:257:
+	uint8_t    frame[0];
+} __packed;

CHECK: Prefer kernel type 'u8' over 'uint8_t'
#423: drivers/net/wireless/espressif/esp32-ng/adapter.h:261:
+	uint8_t    bssid[MAC_ADDR_LEN];

CHECK: Prefer kernel type 'u8' over 'uint8_t'
#424: drivers/net/wireless/espressif/esp32-ng/adapter.h:262:
+	uint8_t    frame_type;

CHECK: Prefer kernel type 'u8' over 'uint8_t'
#425: drivers/net/wireless/espressif/esp32-ng/adapter.h:263:
+	uint8_t    channel;

CHECK: Prefer kernel type 'u32' over 'uint32_t'
#426: drivers/net/wireless/espressif/esp32-ng/adapter.h:264:
+	uint32_t   rssi;

CHECK: Prefer kernel type 'u64' over 'uint64_t'
#427: drivers/net/wireless/espressif/esp32-ng/adapter.h:265:
+	uint64_t   tsf;

CHECK: Prefer kernel type 'u16' over 'uint16_t'
#428: drivers/net/wireless/espressif/esp32-ng/adapter.h:266:
+	uint16_t   frame_len;

CHECK: Prefer kernel type 'u8' over 'uint8_t'
#429: drivers/net/wireless/espressif/esp32-ng/adapter.h:267:
+	uint8_t    pad[2];

CHECK: Prefer kernel type 'u8' over 'uint8_t'
#430: drivers/net/wireless/espressif/esp32-ng/adapter.h:268:
+	uint8_t    frame[0];

ERROR: Use C99 flexible arrays - see https://docs.kernel.org/process/deprecated.html#zero-length-and-one-element-arrays
#431: drivers/net/wireless/espressif/esp32-ng/adapter.h:269:
+	uint8_t    frame[0];
+} __packed;

CHECK: Prefer kernel type 'u8' over 'uint8_t'
#435: drivers/net/wireless/espressif/esp32-ng/adapter.h:273:
+	uint8_t    bssid[MAC_ADDR_LEN];

CHECK: Prefer kernel type 'u8' over 'uint8_t'
#436: drivers/net/wireless/espressif/esp32-ng/adapter.h:274:
+	uint8_t    frame_type;

CHECK: Prefer kernel type 'u8' over 'uint8_t'
#437: drivers/net/wireless/espressif/esp32-ng/adapter.h:275:
+	uint8_t    channel;

CHECK: spaces preferred around that '+' (ctx:VxV)
#438: drivers/net/wireless/espressif/esp32-ng/adapter.h:276:
+	char       ssid[MAX_SSID_LEN+1];
 	                            ^

CHECK: Prefer kernel type 'u8' over 'uint8_t'
#439: drivers/net/wireless/espressif/esp32-ng/adapter.h:277:
+	uint8_t    pad[1];

CHECK: Prefer kernel type 'u16' over 'uint16_t'
#440: drivers/net/wireless/espressif/esp32-ng/adapter.h:278:
+	uint16_t   frame_len;

CHECK: Prefer kernel type 'u32' over 'uint32_t'
#441: drivers/net/wireless/espressif/esp32-ng/adapter.h:279:
+	uint32_t   rssi;

CHECK: Prefer kernel type 'u64' over 'uint64_t'
#442: drivers/net/wireless/espressif/esp32-ng/adapter.h:280:
+	uint64_t   tsf;

CHECK: Prefer kernel type 'u8' over 'uint8_t'
#443: drivers/net/wireless/espressif/esp32-ng/adapter.h:281:
+	uint8_t    frame[0];

ERROR: Use C99 flexible arrays - see https://docs.kernel.org/process/deprecated.html#zero-length-and-one-element-arrays
#444: drivers/net/wireless/espressif/esp32-ng/adapter.h:282:
+	uint8_t    frame[0];
+} __packed;

CHECK: Prefer kernel type 'u8' over 'uint8_t'
#448: drivers/net/wireless/espressif/esp32-ng/adapter.h:286:
+	uint8_t    bssid[MAC_ADDR_LEN];

CHECK: spaces preferred around that '+' (ctx:VxV)
#449: drivers/net/wireless/espressif/esp32-ng/adapter.h:287:
+	char       ssid[MAX_SSID_LEN+1];
 	                            ^

CHECK: Prefer kernel type 'u8' over 'uint8_t'
#450: drivers/net/wireless/espressif/esp32-ng/adapter.h:288:
+	uint8_t    reason;

CHECK: Prefer kernel type 'u8' over 'uint8_t'
#455: drivers/net/wireless/espressif/esp32-ng/adapter.h:293:
+	uint8_t    len;

CHECK: Prefer kernel type 'u8' over 'uint8_t'
#456: drivers/net/wireless/espressif/esp32-ng/adapter.h:294:
+	uint8_t    pad[3];

CHECK: Prefer kernel type 'u8' over 'uint8_t'
#457: drivers/net/wireless/espressif/esp32-ng/adapter.h:295:
+	uint8_t    data[0];

ERROR: Use C99 flexible arrays - see https://docs.kernel.org/process/deprecated.html#zero-length-and-one-element-arrays
#458: drivers/net/wireless/espressif/esp32-ng/adapter.h:296:
+	uint8_t    data[0];
+} __packed;

CHECK: Prefer kernel type 'u8' over 'uint8_t'
#461: drivers/net/wireless/espressif/esp32-ng/adapter.h:299:
+	uint8_t    major1;

CHECK: Prefer kernel type 'u8' over 'uint8_t'
#462: drivers/net/wireless/espressif/esp32-ng/adapter.h:300:
+	uint8_t    major2;

CHECK: Prefer kernel type 'u8' over 'uint8_t'
#463: drivers/net/wireless/espressif/esp32-ng/adapter.h:301:
+	uint8_t    minor;

CHECK: Prefer kernel type 'u32' over 'uint32_t'
#468: drivers/net/wireless/espressif/esp32-ng/adapter.h:306:
+	uint32_t   last_reset_reason;

CHECK: Please don't use multiple blank lines
#471: drivers/net/wireless/espressif/esp32-ng/adapter.h:309:
+
+

CHECK: Prefer kernel type 'u8' over 'uint8_t'
#473: drivers/net/wireless/espressif/esp32-ng/adapter.h:311:
+static inline uint16_t compute_checksum(uint8_t *buf, uint16_t len)

CHECK: Prefer kernel type 'u16' over 'uint16_t'
#475: drivers/net/wireless/espressif/esp32-ng/adapter.h:313:
+	uint16_t checksum = 0;

CHECK: Prefer kernel type 'u16' over 'uint16_t'
#476: drivers/net/wireless/espressif/esp32-ng/adapter.h:314:
+	uint16_t i = 0;

WARNING: Improper SPDX comment style for 'drivers/net/wireless/espressif/esp32-ng/esp.h', please use '/*' instead
#493: drivers/net/wireless/espressif/esp32-ng/esp.h:1:
+// SPDX-License-Identifier: GPL-2.0-only

WARNING: Missing or malformed SPDX-License-Identifier tag in line 1
#493: drivers/net/wireless/espressif/esp32-ng/esp.h:1:
+// SPDX-License-Identifier: GPL-2.0-only

WARNING: Block comments use a trailing */ on a separate line
#528: drivers/net/wireless/espressif/esp32-ng/esp.h:36:
+ * supported values of CONFIG_IDF_FIRMWARE_CHIP_ID are - */

CHECK: spaces preferred around that '*' (ctx:VxV)
#545: drivers/net/wireless/espressif/esp32-ng/esp.h:53:
+#define INTERFACE_HEADER_PADDING (SKB_DATA_ADDR_ALIGNMENT*3)
                                                          ^

CHECK: Prefer kernel type 'u8' over 'uint8_t'
#561: drivers/net/wireless/espressif/esp32-ng/esp.h:69:
+	uint8_t cmd_code;

CHECK: Prefer kernel type 'u8' over 'uint8_t'
#570: drivers/net/wireless/espressif/esp32-ng/esp.h:78:
+	uint8_t                 if_type;

CHECK: Prefer kernel type 'u32' over 'uint32_t'
#571: drivers/net/wireless/espressif/esp32-ng/esp.h:79:
+	uint32_t                capabilities;

WARNING: Block comments use a trailing */ on a separate line
#574: drivers/net/wireless/espressif/esp32-ng/esp.h:82:
+	 * struct esp_sdio_context */

CHECK: Prefer kernel type 'u8' over 'uint8_t'
#587: drivers/net/wireless/espressif/esp32-ng/esp.h:95:
+	uint8_t                 cmd_resp;

CHECK: spinlock_t definition without comment
#592: drivers/net/wireless/espressif/esp32-ng/esp.h:100:
+	spinlock_t              cmd_free_queue_lock;

CHECK: spinlock_t definition without comment
#594: drivers/net/wireless/espressif/esp32-ng/esp.h:102:
+	spinlock_t              cmd_pending_queue_lock;

CHECK: spinlock_t definition without comment
#597: drivers/net/wireless/espressif/esp32-ng/esp.h:105:
+	spinlock_t              cmd_lock;

CHECK: Prefer kernel type 'u8' over 'uint8_t'
#625: drivers/net/wireless/espressif/esp32-ng/esp.h:133:
+	uint8_t                 mac_address[MAC_ADDR_LEN];

CHECK: Prefer kernel type 'u8' over 'uint8_t'
#626: drivers/net/wireless/espressif/esp32-ng/esp.h:134:
+	uint8_t                 if_type;

CHECK: Prefer kernel type 'u8' over 'uint8_t'
#627: drivers/net/wireless/espressif/esp32-ng/esp.h:135:
+	uint8_t                 if_num;

CHECK: Prefer kernel type 'u32' over 'uint32_t'
#629: drivers/net/wireless/espressif/esp32-ng/esp.h:137:
+	uint32_t                ssid_len;

CHECK: Prefer kernel type 'u8' over 'uint8_t'
#630: drivers/net/wireless/espressif/esp32-ng/esp.h:138:
+	uint8_t                 ssid[32];

CHECK: Prefer kernel type 'u8' over 'uint8_t'
#635: drivers/net/wireless/espressif/esp32-ng/esp.h:143:
+	uint8_t                 *assoc_req_ie;

CHECK: Prefer kernel type 'u8' over 'uint8_t'
#638: drivers/net/wireless/espressif/esp32-ng/esp.h:146:
+	uint8_t                 scan_in_progress;

CHECK: Prefer kernel type 'u8' over 'uint8_t'
#639: drivers/net/wireless/espressif/esp32-ng/esp.h:147:
+	uint8_t                 waiting_for_scan_done;

CHECK: Prefer kernel type 'u8' over 'uint8_t'
#641: drivers/net/wireless/espressif/esp32-ng/esp.h:149:
+	uint8_t                 link_state;

WARNING: Use of volatile is usually wrong: see Documentation/process/volatile-considered-harmful.rst
#643: drivers/net/wireless/espressif/esp32-ng/esp.h:151:
+	volatile uint8_t        stop_data;

CHECK: Prefer kernel type 'u8' over 'uint8_t'
#643: drivers/net/wireless/espressif/esp32-ng/esp.h:151:
+	volatile uint8_t        stop_data;

WARNING: Use of volatile is usually wrong: see Documentation/process/volatile-considered-harmful.rst
#644: drivers/net/wireless/espressif/esp32-ng/esp.h:152:
+	volatile uint8_t        port_open;

CHECK: Prefer kernel type 'u8' over 'uint8_t'
#644: drivers/net/wireless/espressif/esp32-ng/esp.h:152:
+	volatile uint8_t        port_open;

CHECK: Prefer kernel type 'u8' over 'uint8_t'
#651: drivers/net/wireless/espressif/esp32-ng/esp.h:159:
+	uint8_t                 tx_pwr_type;

CHECK: Prefer kernel type 'u8' over 'uint8_t'
#652: drivers/net/wireless/espressif/esp32-ng/esp.h:160:
+	uint8_t                 tx_pwr;

CHECK: Please don't use multiple blank lines
#655: drivers/net/wireless/espressif/esp32-ng/esp.h:163:
+
+

WARNING: Improper SPDX comment style for 'drivers/net/wireless/espressif/esp32-ng/esp_api.h', please use '/*' instead
#666: drivers/net/wireless/espressif/esp32-ng/esp_api.h:1:
+// SPDX-License-Identifier: GPL-2.0-only

WARNING: Missing or malformed SPDX-License-Identifier tag in line 1
#666: drivers/net/wireless/espressif/esp32-ng/esp_api.h:1:
+// SPDX-License-Identifier: GPL-2.0-only

WARNING: Macros with flow control statements should be avoided
#678: drivers/net/wireless/espressif/esp32-ng/esp_api.h:13:
+#define RET_ON_FAIL(x)                                                \
+	do {                                                          \
+		int ret = (x);                                        \
+		if (!!(ret)) {                                        \
+		    esp_err("esp32: %d\n", #x, ret); \
+		    return ret;                                       \
+		}                                                     \
+	} while (0);                                                  \
+

WARNING: do {} while (0) macros should not be semicolon terminated
#678: drivers/net/wireless/espressif/esp32-ng/esp_api.h:13:
+#define RET_ON_FAIL(x)                                                \
+	do {                                                          \
+		int ret = (x);                                        \
+		if (!!(ret)) {                                        \
+		    esp_err("esp32: %d\n", #x, ret); \
+		    return ret;                                       \
+		}                                                     \
+	} while (0);                                                  \
+

WARNING: suspect code indent for conditional statements (16, 20)
#681: drivers/net/wireless/espressif/esp32-ng/esp_api.h:16:
+		if (!!(ret)) {                                        \
+		    esp_err("esp32: %d\n", #x, ret); \

WARNING: Statements should start on a tabstop
#683: drivers/net/wireless/espressif/esp32-ng/esp_api.h:18:
+		    return ret;                                       \

WARNING: braces {} are not necessary for any arm of this statement
#731: drivers/net/wireless/espressif/esp32-ng/esp_bt.c:18:
+	if (pkt_type == HCI_COMMAND_PKT) {
[...]
+	} else if (pkt_type == HCI_ACLDATA_PKT) {
[...]
+	} else if (pkt_type == HCI_SCODATA_PKT) {
[...]

WARNING: braces {} are not necessary for any arm of this statement
#747: drivers/net/wireless/espressif/esp32-ng/esp_bt.c:34:
+	if (pkt_type == HCI_EVENT_PKT) {
[...]
+	} else if (pkt_type == HCI_ACLDATA_PKT) {
[...]
+	} else if (pkt_type == HCI_SCODATA_PKT) {
[...]

WARNING: LINUX_VERSION_CODE should be avoided, code should be for the version to which it is merged
#778: drivers/net/wireless/espressif/esp32-ng/esp_bt.c:65:
+#if (LINUX_VERSION_CODE < KERNEL_VERSION(3, 13, 0))

WARNING: Comparisons should place the constant on the right side of the test
#778: drivers/net/wireless/espressif/esp32-ng/esp_bt.c:65:
+#if (LINUX_VERSION_CODE < KERNEL_VERSION(3, 13, 0))

CHECK: No space is necessary after a cast
#807: drivers/net/wireless/espressif/esp32-ng/esp_bt.c:94:
+	if (realloc_skb || !IS_ALIGNED((unsigned long) skb->data, SKB_DATA_ADDR_ALIGNMENT)) {

WARNING: Possible unnecessary 'out of memory' message
#817: drivers/net/wireless/espressif/esp32-ng/esp_bt.c:104:
+		if (!new_skb) {
+			esp_err("Failed to allocate SKB");

CHECK: No space is necessary after a cast
#838: drivers/net/wireless/espressif/esp32-ng/esp_bt.c:125:
+	hdr = (struct esp_payload_header *) skb->data;

WARNING: else is not generally useful after a break or return
#859: drivers/net/wireless/espressif/esp32-ng/esp_bt.c:146:
+		return ret;
+	} else {

WARNING: LINUX_VERSION_CODE should be avoided, code should be for the version to which it is merged
#866: drivers/net/wireless/espressif/esp32-ng/esp_bt.c:153:
+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3, 10, 0))

WARNING: Comparisons should place the constant on the right side of the test
#866: drivers/net/wireless/espressif/esp32-ng/esp_bt.c:153:
+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3, 10, 0))

WARNING: LINUX_VERSION_CODE should be avoided, code should be for the version to which it is merged
#873: drivers/net/wireless/espressif/esp32-ng/esp_bt.c:160:
+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3, 17, 0))

WARNING: Comparisons should place the constant on the right side of the test
#873: drivers/net/wireless/espressif/esp32-ng/esp_bt.c:160:
+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3, 17, 0))

WARNING: braces {} are not necessary for single statement blocks
#902: drivers/net/wireless/espressif/esp32-ng/esp_bt.c:189:
+	if (!adapter) {
+		return -EINVAL;
+	}

WARNING: braces {} are not necessary for single statement blocks
#906: drivers/net/wireless/espressif/esp32-ng/esp_bt.c:193:
+	if (adapter->hcidev) {
+		return -EEXIST;
+	}

WARNING: LINUX_VERSION_CODE should be avoided, code should be for the version to which it is merged
#924: drivers/net/wireless/espressif/esp32-ng/esp_bt.c:211:
+    #if (LINUX_VERSION_CODE >= KERNEL_VERSION(4, 7, 0))

WARNING: Comparisons should place the constant on the right side of the test
#924: drivers/net/wireless/espressif/esp32-ng/esp_bt.c:211:
+    #if (LINUX_VERSION_CODE >= KERNEL_VERSION(4, 7, 0))

CHECK: Blank lines aren't necessary after an open brace '{'
#930: drivers/net/wireless/espressif/esp32-ng/esp_bt.c:217:
+	if (hdev->bus == INVALID_HDEV_BUS) {
+

WARNING: braces {} are not necessary for any arm of this statement
#931: drivers/net/wireless/espressif/esp32-ng/esp_bt.c:218:
+		if (adapter->if_type == ESP_IF_TYPE_SDIO) {
[...]
+		} else if (adapter->if_type == ESP_IF_TYPE_SPI) {
[...]
+		} else {
[...]

WARNING: LINUX_VERSION_CODE should be avoided, code should be for the version to which it is merged
#948: drivers/net/wireless/espressif/esp32-ng/esp_bt.c:235:
+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3, 10, 0))

WARNING: Comparisons should place the constant on the right side of the test
#948: drivers/net/wireless/espressif/esp32-ng/esp_bt.c:235:
+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3, 10, 0))

WARNING: LINUX_VERSION_CODE should be avoided, code should be for the version to which it is merged
#952: drivers/net/wireless/espressif/esp32-ng/esp_bt.c:239:
+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3, 17, 0))

WARNING: Comparisons should place the constant on the right side of the test
#952: drivers/net/wireless/espressif/esp32-ng/esp_bt.c:239:
+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3, 17, 0))

WARNING: Improper SPDX comment style for 'drivers/net/wireless/espressif/esp32-ng/esp_bt_api.h', please use '/*' instead
#973: drivers/net/wireless/espressif/esp32-ng/esp_bt_api.h:1:
+// SPDX-License-Identifier: GPL-2.0-only

WARNING: Missing or malformed SPDX-License-Identifier tag in line 1
#973: drivers/net/wireless/espressif/esp32-ng/esp_bt_api.h:1:
+// SPDX-License-Identifier: GPL-2.0-only

CHECK: Please don't use multiple blank lines
#986: drivers/net/wireless/espressif/esp32-ng/esp_bt_api.h:14:
+
+

WARNING: LINUX_VERSION_CODE should be avoided, code should be for the version to which it is merged
#987: drivers/net/wireless/espressif/esp32-ng/esp_bt_api.h:15:
+#if (LINUX_VERSION_CODE < KERNEL_VERSION(4, 5, 0))

WARNING: Comparisons should place the constant on the right side of the test
#987: drivers/net/wireless/espressif/esp32-ng/esp_bt_api.h:15:
+#if (LINUX_VERSION_CODE < KERNEL_VERSION(4, 5, 0))

WARNING: LINUX_VERSION_CODE should be avoided, code should be for the version to which it is merged
#988: drivers/net/wireless/espressif/esp32-ng/esp_bt_api.h:16:
+	#if (LINUX_VERSION_CODE >= KERNEL_VERSION(2, 6, 34))

WARNING: Comparisons should place the constant on the right side of the test
#988: drivers/net/wireless/espressif/esp32-ng/esp_bt_api.h:16:
+	#if (LINUX_VERSION_CODE >= KERNEL_VERSION(2, 6, 34))

WARNING: LINUX_VERSION_CODE should be avoided, code should be for the version to which it is merged
#995: drivers/net/wireless/espressif/esp32-ng/esp_bt_api.h:23:
+#if (LINUX_VERSION_CODE < KERNEL_VERSION(4, 8, 0))

WARNING: Comparisons should place the constant on the right side of the test
#995: drivers/net/wireless/espressif/esp32-ng/esp_bt_api.h:23:
+#if (LINUX_VERSION_CODE < KERNEL_VERSION(4, 8, 0))

WARNING: LINUX_VERSION_CODE should be avoided, code should be for the version to which it is merged
#996: drivers/net/wireless/espressif/esp32-ng/esp_bt_api.h:24:
+	#if (LINUX_VERSION_CODE >= KERNEL_VERSION(2, 6, 34))

WARNING: Comparisons should place the constant on the right side of the test
#996: drivers/net/wireless/espressif/esp32-ng/esp_bt_api.h:24:
+	#if (LINUX_VERSION_CODE >= KERNEL_VERSION(2, 6, 34))

WARNING: Block comments should align the * on each line
#1030: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:16:
+/**
+  * @brief WiFi PHY rate encodings

WARNING: do not add new typedefs
#1033: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:19:
+typedef enum {

WARNING: line length of 106 exceeds 100 columns
#1049: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:35:
+	WIFI_PHY_RATE_MCS0_LGI  = 0x10, /**< MCS0 with long GI, 6.5 Mbps for 20MHz, 13.5 Mbps for 40MHz */

WARNING: line length of 103 exceeds 100 columns
#1050: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:36:
+	WIFI_PHY_RATE_MCS1_LGI  = 0x11, /**< MCS1 with long GI, 13 Mbps for 20MHz, 27 Mbps for 40MHz */

WARNING: line length of 107 exceeds 100 columns
#1051: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:37:
+	WIFI_PHY_RATE_MCS2_LGI  = 0x12, /**< MCS2 with long GI, 19.5 Mbps for 20MHz, 40.5 Mbps for 40MHz */

WARNING: line length of 103 exceeds 100 columns
#1052: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:38:
+	WIFI_PHY_RATE_MCS3_LGI  = 0x13, /**< MCS3 with long GI, 26 Mbps for 20MHz, 54 Mbps for 40MHz */

WARNING: line length of 103 exceeds 100 columns
#1053: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:39:
+	WIFI_PHY_RATE_MCS4_LGI  = 0x14, /**< MCS4 with long GI, 39 Mbps for 20MHz, 81 Mbps for 40MHz */

WARNING: line length of 104 exceeds 100 columns
#1054: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:40:
+	WIFI_PHY_RATE_MCS5_LGI  = 0x15, /**< MCS5 with long GI, 52 Mbps for 20MHz, 108 Mbps for 40MHz */

WARNING: line length of 108 exceeds 100 columns
#1055: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:41:
+	WIFI_PHY_RATE_MCS6_LGI  = 0x16, /**< MCS6 with long GI, 58.5 Mbps for 20MHz, 121.5 Mbps for 40MHz */

WARNING: line length of 104 exceeds 100 columns
#1056: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:42:
+	WIFI_PHY_RATE_MCS7_LGI  = 0x17, /**< MCS7 with long GI, 65 Mbps for 20MHz, 135 Mbps for 40MHz */

WARNING: line length of 105 exceeds 100 columns
#1057: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:43:
+	WIFI_PHY_RATE_MCS0_SGI  = 0x18, /**< MCS0 with short GI, 7.2 Mbps for 20MHz, 15 Mbps for 40MHz */

WARNING: line length of 106 exceeds 100 columns
#1058: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:44:
+	WIFI_PHY_RATE_MCS1_SGI  = 0x19, /**< MCS1 with short GI, 14.4 Mbps for 20MHz, 30 Mbps for 40MHz */

WARNING: line length of 106 exceeds 100 columns
#1059: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:45:
+	WIFI_PHY_RATE_MCS2_SGI  = 0x1A, /**< MCS2 with short GI, 21.7 Mbps for 20MHz, 45 Mbps for 40MHz */

WARNING: line length of 106 exceeds 100 columns
#1060: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:46:
+	WIFI_PHY_RATE_MCS3_SGI  = 0x1B, /**< MCS3 with short GI, 28.9 Mbps for 20MHz, 60 Mbps for 40MHz */

WARNING: line length of 106 exceeds 100 columns
#1061: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:47:
+	WIFI_PHY_RATE_MCS4_SGI  = 0x1C, /**< MCS4 with short GI, 43.3 Mbps for 20MHz, 90 Mbps for 40MHz */

WARNING: line length of 107 exceeds 100 columns
#1062: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:48:
+	WIFI_PHY_RATE_MCS5_SGI  = 0x1D, /**< MCS5 with short GI, 57.8 Mbps for 20MHz, 120 Mbps for 40MHz */

WARNING: line length of 105 exceeds 100 columns
#1063: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:49:
+	WIFI_PHY_RATE_MCS6_SGI  = 0x1E, /**< MCS6 with short GI, 65 Mbps for 20MHz, 135 Mbps for 40MHz */

WARNING: line length of 107 exceeds 100 columns
#1064: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:50:
+	WIFI_PHY_RATE_MCS7_SGI  = 0x1F, /**< MCS7 with short GI, 72.2 Mbps for 20MHz, 150 Mbps for 40MHz */

CHECK: Please don't use multiple blank lines
#1086: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:72:
+
+

CHECK: Alignment should match open parenthesis
#1131: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:117:
+static int esp_inetaddr_event(struct notifier_block *nb,
+	unsigned long event, void *data)

WARNING: braces {} are not necessary for single statement blocks
#1139: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:125:
+	if (!strstr(netdev->name, "espsta")) {
+		return 0;
+	}

CHECK: Blank lines aren't necessary after an open brace '{'
#1144: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:130:
+	switch (event) {
+

CHECK: Unnecessary parentheses around 'priv->if_type == ESP_STA_IF'
#1146: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:132:
+		if (priv && (priv->if_type == ESP_STA_IF)) {

CHECK: Alignment should match open parenthesis
#1149: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:135:
+			esp_info("NETDEV_UP interface %s ip changed to  %pi4\n",
+					netdev->name, &ifa->ifa_local);

CHECK: Unnecessary parentheses around 'priv->if_type == ESP_STA_IF'
#1155: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:141:
+		if (priv && (priv->if_type == ESP_STA_IF))

CHECK: Alignment should match open parenthesis
#1164: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:150:
+struct wireless_dev *esp_cfg80211_add_iface(struct wiphy *wiphy,
+		const char *name,

CHECK: Prefer kernel type 'u8' over 'uint8_t'
#1173: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:159:
+	uint8_t esp_nw_if_num = 0;

CHECK: Alignment should match open parenthesis
#1193: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:179:
+		esp_info("%u network type[%u] is not supported\n",
+				 __LINE__, type);

CHECK: Alignment should match open parenthesis
#1198: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:184:
+	ndev = ALLOC_NETDEV(sizeof(struct esp_wifi_device), name, name_assign_type,
+			ether_setup);

WARNING: Block comments use a trailing */ on a separate line
#1213: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:199:
+	 * esp_nw_if_num, esp_wdev->adapter->priv[esp_nw_if_num]);*/

CHECK: Please don't use multiple blank lines
#1236: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:222:
+
+

WARNING: Consider removing the code enclosed by this #if 0 and its #endif
#1255: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:241:
+#if 0

CHECK: Alignment should match open parenthesis
#1257: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:243:
+static int esp_cfg80211_del_iface(struct wiphy *wiphy,
+							  struct wireless_dev *wdev)

CHECK: Alignment should match open parenthesis
#1263: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:249:
+static int esp_cfg80211_change_iface(struct wiphy *wiphy,
+							  struct net_device *ndev,

CHECK: Alignment should match open parenthesis
#1272: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:258:
+static int esp_cfg80211_scan(struct wiphy *wiphy,
+		struct cfg80211_scan_request *request)

CHECK: Blank lines aren't necessary after an open brace '{'
#1274: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:260:
+{
+

WARNING: Consider removing the code enclosed by this #if 0 and its #endif
#1295: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:281:
+#if 0

CHECK: Alignment should match open parenthesis
#1297: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:283:
+static int esp_cfg80211_connect(struct wiphy *wiphy, struct net_device *dev,
+							  struct cfg80211_connect_params *sme)

WARNING: braces {} are not necessary for single statement blocks
#1375: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:361:
+	if (params->key_len == 0) {
+		return esp_cfg80211_del_key(wiphy, dev, ZERO_LINK_ID key_index, pairwise, mac_addr);
+	}

CHECK: Alignment should match open parenthesis
#1382: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:368:
+static int esp_cfg80211_disconnect(struct wiphy *wiphy,
+		struct net_device *dev, u16 reason_code)

CHECK: Alignment should match open parenthesis
#1403: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:389:
+static int esp_cfg80211_authenticate(struct wiphy *wiphy, struct net_device *dev,
+		struct cfg80211_auth_request *req)

CHECK: Please don't use multiple blank lines
#1424: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:410:
+
+

CHECK: Alignment should match open parenthesis
#1426: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:412:
+static int esp_cfg80211_associate(struct wiphy *wiphy, struct net_device *dev,
+		struct cfg80211_assoc_request *req)

CHECK: Alignment should match open parenthesis
#1448: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:434:
+static int esp_cfg80211_deauth(struct wiphy *wiphy, struct net_device *dev,
+		struct cfg80211_deauth_request *req)

CHECK: Alignment should match open parenthesis
#1469: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:455:
+static int esp_cfg80211_disassoc(struct wiphy *wiphy, struct net_device *dev,
+		struct cfg80211_disassoc_request *req)

CHECK: Alignment should match open parenthesis
#1490: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:476:
+static int esp_cfg80211_suspend(struct wiphy *wiphy,
+			struct cfg80211_wowlan *wowlan)

CHECK: Alignment should match open parenthesis
#1503: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:489:
+static void esp_cfg80211_set_wakeup(struct wiphy *wiphy,
+			bool enabled)

WARNING: unnecessary whitespace before a quoted newline
#1536: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:522:
+		esp_info("%u invalid input %p %p \n", __LINE__, wiphy, wdev);

ERROR: code indent should use tabs where possible
#1548: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:534:
+        switch (type) {$

WARNING: please, no spaces at the start of a line
#1548: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:534:
+        switch (type) {$

ERROR: code indent should use tabs where possible
#1549: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:535:
+        case NL80211_TX_POWER_AUTOMATIC:$

WARNING: please, no spaces at the start of a line
#1549: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:535:
+        case NL80211_TX_POWER_AUTOMATIC:$

ERROR: code indent should use tabs where possible
#1550: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:536:
+                priv->tx_pwr_type = NL80211_TX_POWER_AUTOMATIC;$

WARNING: please, no spaces at the start of a line
#1550: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:536:
+                priv->tx_pwr_type = NL80211_TX_POWER_AUTOMATIC;$

ERROR: code indent should use tabs where possible
#1551: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:537:
+                priv->tx_pwr = mbm_to_esp_pwr(MAX_TX_POWER_MBM);$

WARNING: please, no spaces at the start of a line
#1551: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:537:
+                priv->tx_pwr = mbm_to_esp_pwr(MAX_TX_POWER_MBM);$

ERROR: code indent should use tabs where possible
#1552: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:538:
+                break;$

WARNING: please, no spaces at the start of a line
#1552: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:538:
+                break;$

ERROR: code indent should use tabs where possible
#1553: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:539:
+        case NL80211_TX_POWER_LIMITED:$

WARNING: please, no spaces at the start of a line
#1553: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:539:
+        case NL80211_TX_POWER_LIMITED:$

ERROR: code indent should use tabs where possible
#1554: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:540:
+                if (!is_txpwr_valid(mbm)) {$

WARNING: please, no spaces at the start of a line
#1554: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:540:
+                if (!is_txpwr_valid(mbm)) {$

ERROR: code indent should use tabs where possible
#1555: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:541:
+                        esp_warn("mbm:%d not support\n", mbm);$

WARNING: please, no spaces at the start of a line
#1555: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:541:
+                        esp_warn("mbm:%d not support\n", mbm);$

ERROR: code indent should use tabs where possible
#1557: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:543:
+                }$

WARNING: please, no spaces at the start of a line
#1557: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:543:
+                }$

ERROR: code indent should use tabs where possible
#1558: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:544:
+                priv->tx_pwr_type = NL80211_TX_POWER_LIMITED;$

WARNING: please, no spaces at the start of a line
#1558: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:544:
+                priv->tx_pwr_type = NL80211_TX_POWER_LIMITED;$

ERROR: code indent should use tabs where possible
#1559: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:545:
+                priv->tx_pwr = mbm_to_esp_pwr(mbm);$

WARNING: please, no spaces at the start of a line
#1559: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:545:
+                priv->tx_pwr = mbm_to_esp_pwr(mbm);$

ERROR: code indent should use tabs where possible
#1560: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:546:
+                break;$

WARNING: please, no spaces at the start of a line
#1560: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:546:
+                break;$

ERROR: code indent should use tabs where possible
#1561: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:547:
+        case NL80211_TX_POWER_FIXED:$

WARNING: please, no spaces at the start of a line
#1561: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:547:
+        case NL80211_TX_POWER_FIXED:$

ERROR: code indent should use tabs where possible
#1563: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:549:
+                break;$

WARNING: please, no spaces at the start of a line
#1563: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:549:
+                break;$

ERROR: code indent should use tabs where possible
#1564: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:550:
+        default:$

ERROR: code indent should use tabs where possible
#1565: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:551:
+                esp_warn("unknown type:%d\n", type);$

WARNING: please, no spaces at the start of a line
#1565: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:551:
+                esp_warn("unknown type:%d\n", type);$

ERROR: code indent should use tabs where possible
#1566: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:552:
+        }$

WARNING: please, no spaces at the start of a line
#1566: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:552:
+        }$

WARNING: Consider removing the code enclosed by this #if 0 and its #endif
#1596: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:582:
+#if 0

WARNING: unnecessary whitespace before a quoted newline
#1633: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:619:
+		esp_info("%u esp_dev not initialized yet \n", __LINE__);

WARNING: unnecessary whitespace before a quoted newline
#1639: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:625:
+		esp_info("%u esp_wifi_device not initialized yet \n", __LINE__);

WARNING: line length of 106 exceeds 100 columns
#1643: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:629:
+		    request->alpha2[0], request->alpha2[1], priv->country_code[0], priv->country_code[1]);

CHECK: Alignment should match open parenthesis
#1643: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:629:
+	esp_info("cfg80211 regulatory domain callback for %c%c, current=%c%c\n",
+		    request->alpha2[0], request->alpha2[1], priv->country_code[0], priv->country_code[1]);

WARNING: Prefer strscpy over strlcpy - see: https://github.com/KSPP/linux/issues/89
#1658: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:644:
+		strlcpy(priv->country_code, request->alpha2, MAX_COUNTRY_LEN);

CHECK: Alignment should match open parenthesis
#1714: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:700:
+int esp_mark_disconnect(struct esp_wifi_device *priv, uint16_t reason,
+		uint8_t locally_disconnect)

CHECK: Alignment should match open parenthesis
#1719: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:705:
+			CFG80211_DISCONNECTED(priv->ndev, reason, NULL, 0, locally_disconnect,
+					GFP_KERNEL);

CHECK: Alignment should match open parenthesis
#1724: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:710:
+int esp_mark_scan_done_and_disconnect(struct esp_wifi_device *priv,
+		uint8_t locally_disconnect)

CHECK: Blank lines aren't necessary after an open brace '{'
#1726: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:712:
+{
+

WARNING: Improper SPDX comment style for 'drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.h', please use '/*' instead
#1744: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.h:1:
+// SPDX-License-Identifier: GPL-2.0-only

WARNING: Missing or malformed SPDX-License-Identifier tag in line 1
#1744: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.h:1:
+// SPDX-License-Identifier: GPL-2.0-only

CHECK: Alignment should match open parenthesis
#1757: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.h:14:
+struct wireless_dev *esp_cfg80211_add_iface(struct wiphy *wiphy,
+			      const char *name,

CHECK: Alignment should match open parenthesis
#1764: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.h:21:
+int esp_mark_disconnect(struct esp_wifi_device *priv, uint16_t reason,
+		uint8_t locally_disconnect);

CHECK: Alignment should match open parenthesis
#1766: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.h:23:
+int esp_mark_scan_done_and_disconnect(struct esp_wifi_device *priv,
+		uint8_t locally_disconnect);

WARNING: macros should not use a trailing semicolon
#1790: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:16:
+#define PRINT_HEXDUMP(STR, ARG, ARG_LEN, level) \
+	print_hex_dump(KERN_INFO, STR, DUMP_PREFIX_ADDRESS, 16, 1, ARG, ARG_LEN, 1);

WARNING: externs should be avoided in .c files
#1796: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:22:
+int internal_scan_request(struct esp_wifi_device *priv, char *ssid,

CHECK: Alignment should match open parenthesis
#1797: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:23:
+int internal_scan_request(struct esp_wifi_device *priv, char *ssid,
+		uint8_t channel, uint8_t is_blocking);

CHECK: Prefer kernel type 'u8' over 'uint8_t'
#1797: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:23:
+		uint8_t channel, uint8_t is_blocking);

WARNING: braces {} are not necessary for single statement blocks
#1822: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:48:
+	if (!cmd_node->cmd_skb) {
+		esp_err("No free cmd node skb found\n");
+	}

WARNING: Possible unnecessary 'out of memory' message
#1823: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:49:
+	if (!cmd_node->cmd_skb) {
+		esp_err("No free cmd node skb found\n");

CHECK: Alignment should match open parenthesis
#1842: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:68:
+static void queue_cmd_node(struct esp_adapter *adapter,
+		struct command_node *cmd_node, u8 flag_high_prio)

CHECK: Alignment should match open parenthesis
#1855: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:81:
+static int decode_mac_addr(struct esp_wifi_device *priv,
+		struct command_node *cmd_node)

CHECK: No space is necessary after a cast
#1867: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:93:
+	header = (struct cmd_config_mac_address *) (cmd_node->resp_skb->data);

CHECK: Alignment should match open parenthesis
#1883: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:109:
+static int decode_tx_power(struct esp_wifi_device *priv,
+		struct command_node *cmd_node)

CHECK: No space is necessary after a cast
#1895: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:121:
+	header = (struct cmd_set_get_val *) (cmd_node->resp_skb->data);

CHECK: Please don't use multiple blank lines
#1915: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:141:
+
+

CHECK: Blank lines aren't necessary after an open brace '{'
#1917: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:143:
+	if (!cmd_node || !cmd_node->resp_skb || !cmd_node->resp_skb->data) {
+

CHECK: No space is necessary after a cast
#1927: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:153:
+	cmd = (struct command_header *) (cmd_node->resp_skb->data);

CHECK: Alignment should match open parenthesis
#1938: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:164:
+static void recycle_cmd_node(struct esp_adapter *adapter,
+		struct command_node *cmd_node)

CHECK: Please don't use multiple blank lines
#1950: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:176:
+
+

CHECK: Alignment should match open parenthesis
#1952: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:178:
+static int wait_and_decode_cmd_resp(struct esp_wifi_device *priv,
+		struct command_node *cmd_node)

CHECK: Alignment should match open parenthesis
#1971: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:197:
+	ret = wait_event_interruptible_timeout(adapter->wait_for_cmd_resp,
+			adapter->cmd_resp == cmd_node->cmd_code, COMMAND_RESPONSE_TIMEOUT);

CHECK: Blank lines aren't necessary after an open brace '{'
#1990: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:216:
+	switch (cmd_node->cmd_code) {
+

WARNING: Prefer 'fallthrough;' over fallthrough comment
#2012: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:238:
+		/* intentional fallthrough */

CHECK: Blank lines aren't necessary after an open brace '{'
#2050: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:276:
+	for (i = 0; i < ESP_NUM_OF_CMD_NODES; i++) {
+

CHECK: Blank lines aren't necessary after an open brace '{'
#2076: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:302:
+	for (i = 0; i < ESP_NUM_OF_CMD_NODES; i++) {
+

CHECK: Alignment should match open parenthesis
#2146: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:372:
+		payload_header->checksum = cpu_to_le16(compute_checksum(cmd_node->cmd_skb->data,
+					payload_header->len+payload_header->offset));

CHECK: spaces preferred around that '+' (ctx:VxV)
#2146: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:372:
+					payload_header->len+payload_header->offset));
 					                   ^

CHECK: No space is necessary after a cast
#2223: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:449:
+	cmd = (struct command_header *) (node->cmd_skb->data + payload_header->offset);

CHECK: Please don't use multiple blank lines
#2253: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:479:
+
+

CHECK: Alignment should match open parenthesis
#2261: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:487:
+static void process_scan_result_event(struct esp_wifi_device *priv,
+		struct scan_event *scan_evt)

WARNING: Block comments use * on subsequent lines
#2279: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:505:
+	/*if (!priv->scan_in_progress) {
+		return;

WARNING: Block comments use a trailing */ on a separate line
#2280: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:506:
+	}*/

CHECK: Blank lines aren't necessary after an open brace '{'
#2284: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:510:
+	if (scan_evt->header.status == 0) {
+

CHECK: No space is necessary after a cast
#2293: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:519:
+	ie_buf = (u8 *) scan_evt->frame;

CHECK: No space is necessary after a cast
#2296: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:522:
+	fixed_params = (struct beacon_probe_fixed_params *) ie_buf;

CHECK: Alignment should match open parenthesis
#2310: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:536:
+		bss = CFG80211_INFORM_BSS(priv->adapter->wiphy, chan,
+				scan_evt->bssid, timestamp,

CHECK: Alignment should match open parenthesis
#2322: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:548:
+static void process_auth_event(struct esp_wifi_device *priv,
+		struct auth_event *event)

WARNING: Consider removing the code enclosed by this #if 0 and its #endif
#2329: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:555:
+#if 0

CHECK: Alignment should match open parenthesis
#2331: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:557:
+	print_hex_dump(KERN_INFO, "Auth frame: ", DUMP_PREFIX_ADDRESS, 16, 1,
+			event->frame, event->frame_len, 1);

CHECK: Blank lines aren't necessary before a close brace '}'
#2336: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:562:
+
+}

CHECK: Alignment should match open parenthesis
#2339: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:565:
+static void process_disconnect_event(struct esp_wifi_device *priv,
+		struct disconnect_event *event)

CHECK: Alignment should match open parenthesis
#2347: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:573:
+	esp_info("Disconnect event for ssid %s [reason:%d]\n",
+			event->ssid, event->reason);

CHECK: Alignment should match open parenthesis
#2353: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:579:
+static void process_assoc_event(struct esp_wifi_device *priv,
+		struct assoc_event *event)

CHECK: Alignment should match open parenthesis
#2367: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:593:
+	CFG80211_RX_ASSOC_RESP(priv->ndev, priv->bss, event->frame, event->frame_len,
+			0, priv->assoc_req_ie, priv->assoc_req_ie_len);

WARNING: Consider removing the code enclosed by this #if 0 and its #endif
#2369: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:595:
+#if 0

CHECK: Alignment should match open parenthesis
#2372: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:598:
+		cfg80211_connect_bss(priv->ndev, mac, priv->bss, NULL, 0, NULL, 0,
+				0, GFP_KERNEL, NL80211_TIMEOUT_UNSPECIFIED);

CHECK: Alignment should match open parenthesis
#2375: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:601:
+		cfg80211_connect_result(priv->ndev, mac, NULL, 0, NULL, 0,
+				0, GFP_KERNEL);

CHECK: No space is necessary after a cast
#2391: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:617:
+	header = (struct event_header *) (skb->data);

CHECK: Blank lines aren't necessary after an open brace '{'
#2394: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:620:
+	switch (header->event_code) {
+

CHECK: Alignment should match open parenthesis
#2397: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:623:
+		process_scan_result_event(priv,
+				(struct scan_event *)(skb->data));

CHECK: Alignment should match open parenthesis
#2402: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:628:
+		process_assoc_event(priv,
+				(struct assoc_event *)(skb->data));

CHECK: Alignment should match open parenthesis
#2407: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:633:
+		process_disconnect_event(priv,
+				(struct disconnect_event *)(skb->data));

CHECK: Alignment should match open parenthesis
#2416: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:642:
+		esp_info("%u unhandled event[%u]\n",
+				__LINE__, header->event_code);

CHECK: Alignment should match open parenthesis
#2437: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:663:
+	cmd_node = prepare_command_request(priv->adapter, CMD_SET_MCAST_MAC_ADDR,
+			sizeof(struct cmd_set_mcast_mac_addr));

CHECK: Alignment should match open parenthesis
#2449: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:675:
+	memcpy(cmd_mcast_mac_list->mcast_addr, list->mcast_addr,
+			sizeof(cmd_mcast_mac_list->mcast_addr));

CHECK: Alignment should match open parenthesis
#2472: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:698:
+	cmd_node = prepare_command_request(priv->adapter, CMD_SET_IP_ADDR,
+			sizeof(struct cmd_set_ip_addr));

CHECK: Alignment should match open parenthesis
#2506: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:732:
+	cmd_node = prepare_command_request(priv->adapter, CMD_STA_DISCONNECT,
+			sizeof(struct cmd_sta_disconnect));

WARNING: Consider removing the code enclosed by this #if 0 and its #endif
#2526: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:752:
+#if 0

CHECK: Alignment should match open parenthesis
#2528: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:754:
+int cmd_connect_request(struct esp_wifi_device *priv,
+		struct cfg80211_connect_params *params)

WARNING: line length of 103 exceeds 100 columns
#2557: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:783:
+	cmd = (struct cmd_sta_connect *) (cmd_node->cmd_skb->data + sizeof(struct esp_payload_header));

CHECK: No space is necessary after a cast
#2557: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:783:
+	cmd = (struct cmd_sta_connect *) (cmd_node->cmd_skb->data + sizeof(struct esp_payload_header));

CHECK: Concatenated strings should use spaces between elements
#2584: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:810:
+	esp_info("Connection request: %s "MACSTR" %d\n",

CHECK: Alignment should match open parenthesis
#2585: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:811:
+	esp_info("Connection request: %s "MACSTR" %d\n",
+			cmd->ssid, MAC2STR(params->bssid), cmd->channel);

WARNING: line length of 111 exceeds 100 columns
#2589: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:815:
+				params->ssid, params->ssid_len, IEEE80211_BSS_TYPE_ESS, IEEE80211_PRIVACY_ANY);

CHECK: Alignment should match open parenthesis
#2589: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:815:
+		bss = cfg80211_get_bss(adapter->wiphy, params->channel, params->bssid,
+				params->ssid, params->ssid_len, IEEE80211_BSS_TYPE_ESS, IEEE80211_PRIVACY_ANY);

WARNING: else is not generally useful after a break or return
#2593: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:819:
+			break;
+		} else {

CHECK: Please don't use multiple blank lines
#2615: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:841:
+
+

CHECK: Alignment should match open parenthesis
#2617: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:843:
+int cmd_assoc_request(struct esp_wifi_device *priv,
+		struct cfg80211_assoc_request *req)

WARNING: line length of 101 exceeds 100 columns
#2647: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:873:
+	cmd = (struct cmd_sta_assoc *) (cmd_node->cmd_skb->data + sizeof(struct esp_payload_header));

CHECK: No space is necessary after a cast
#2647: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:873:
+	cmd = (struct cmd_sta_assoc *) (cmd_node->cmd_skb->data + sizeof(struct esp_payload_header));

WARNING: kfree(NULL) is safe and this check is probably not required
#2654: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:880:
+	if (priv->assoc_req_ie) {
+		kfree(priv->assoc_req_ie);

WARNING: Possible unnecessary 'out of memory' message
#2661: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:887:
+	if (!priv->assoc_req_ie) {
+		esp_err("Failed to allocate buffer for assoc request IEs\n");

CHECK: Concatenated strings should use spaces between elements
#2667: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:893:
+	esp_info("Association request: "MACSTR" %d %d\n",

CHECK: Alignment should match open parenthesis
#2668: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:894:
+	esp_info("Association request: "MACSTR" %d %d\n",
+			MAC2STR(bss->bssid), bss->channel->hw_value, cmd->assoc_ie_len);

CHECK: Alignment should match open parenthesis
#2679: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:905:
+int cmd_auth_request(struct esp_wifi_device *priv,
+		struct cfg80211_auth_request *req)

CHECK: No space is necessary after a cast
#2713: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:939:
+	cmd = (struct cmd_sta_auth *) (cmd_node->cmd_skb->data + sizeof(struct esp_payload_header));

CHECK: Concatenated strings should use spaces between elements
#2721: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:947:
+	esp_info("Authentication request: "MACSTR" %d %d %d %d\n",

CHECK: Alignment should match open parenthesis
#2722: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:948:
+	esp_info("Authentication request: "MACSTR" %d %d %d %d\n",
+			MAC2STR(cmd->bssid), cmd->channel, cmd->auth_type, cmd->auth_data_len,

CHECK: No space is necessary after a cast
#2723: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:949:
+			(u32) req->ie_len);

WARNING: Consider removing the code enclosed by this #if 0 and its #endif
#2724: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:950:
+#if 0

CHECK: Alignment should match open parenthesis
#2727: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:953:
+		bss1 = cfg80211_get_bss(adapter->wiphy, bss->channel, bss->bssid,
+				NULL, 0, IEEE80211_BSS_TYPE_ESS, IEEE80211_PRIVACY_ANY);

WARNING: else is not generally useful after a break or return
#2731: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:957:
+			break;
+		} else {

WARNING: Consider removing the code enclosed by this #if 0 and its #endif
#2759: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:985:
+#if 0

CHECK: Alignment should match open parenthesis
#2762: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:988:
+		esp_err("invalid key index[%u] > max[%u]\n",
+				key_index, ESP_MAX_KEY_INDEX);

CHECK: No space is necessary after a cast
#2781: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:1007:
+	cmd = (struct cmd_key_operation *) (cmd_node->cmd_skb->data +

WARNING: Consider removing the code enclosed by this #if 0 and its #endif
#2814: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:1040:
+#if 0

CHECK: Alignment should match open parenthesis
#2817: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:1043:
+		esp_err("invalid key index[%u] > max[%u]\n",
+				key_index, ESP_MAX_KEY_INDEX);

CHECK: No space is necessary after a cast
#2834: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:1060:
+	cmd = (struct cmd_key_operation *) (cmd_node->cmd_skb->data +

WARNING: Consider removing the code enclosed by this #if 0 and its #endif
#2862: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:1088:
+#if 0

CHECK: Alignment should match open parenthesis
#2864: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:1090:
+	esp_info("%u key_idx: %u params->key_len: %u\nparams->seq_len:%u params->mode: 0x%x\nparams->cipher: 0x%x\n",
+      __LINE__,

WARNING: please, no spaces at the start of a line
#2864: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:1090:
+      __LINE__,$

WARNING: please, no spaces at the start of a line
#2865: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:1091:
+      key_index, pairwise, params->key_len, params->seq_len, params->mode, params->cipher);$

WARNING: Consider removing the code enclosed by this #if 0 and its #endif
#2873: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:1099:
+#if 0

CHECK: Alignment should match open parenthesis
#2876: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:1102:
+		esp_err("invalid key index[%u] > max[%u]\n",
+				key_index, ESP_MAX_KEY_INDEX);

WARNING: Consider removing the code enclosed by this #if 0 and its #endif
#2898: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:1124:
+#if 0

CHECK: Alignment should match open parenthesis
#2900: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:1126:
+		print_hex_dump(KERN_INFO, "mac: ", DUMP_PREFIX_ADDRESS, 16, 1,
+				mac, MAC_ADDR_LEN, 1);

CHECK: No space is necessary after a cast
#2912: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:1138:
+	cmd = (struct cmd_key_operation *) (cmd_node->cmd_skb->data +

WARNING: Consider removing the code enclosed by this #if 0 and its #endif
#2930: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:1156:
+#if 0

WARNING: Consider removing the code enclosed by this #if 0 and its #endif
#2937: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:1163:
+#if 0

CHECK: Alignment should match open parenthesis
#2939: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:1165:
+	esp_err("%u algo: %u seq_len: %u len:%u\n", __LINE__,
+			key->algo, key->index, key->seq_len, key->len);

CHECK: Alignment should match open parenthesis
#3011: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:1237:
+int internal_scan_request(struct esp_wifi_device *priv, char *ssid,
+		uint8_t channel, uint8_t is_blocking)

CHECK: Prefer kernel type 'u8' over 'uint8_t'
#3011: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:1237:
+		uint8_t channel, uint8_t is_blocking)

CHECK: No space is necessary after a cast
#3042: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:1268:
+	scan_req = (struct scan_request *) (cmd_node->cmd_skb->data +

WARNING: braces {} are not necessary for single statement blocks
#3045: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:1271:
+	if (ssid) {
+		memcpy(scan_req->ssid, ssid, MAX_SSID_LEN);
+	}

CHECK: Alignment should match open parenthesis
#3065: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:1291:
+		wait_event_interruptible_timeout(priv->wait_for_scan_completion,
+				priv->waiting_for_scan_done != true, COMMAND_RESPONSE_TIMEOUT);

CHECK: Using comparison to true is error prone
#3065: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:1291:
+				priv->waiting_for_scan_done != true, COMMAND_RESPONSE_TIMEOUT);

CHECK: No space is necessary after a cast
#3101: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:1327:
+	scan_req = (struct scan_request *) (cmd_node->cmd_skb->data +

WARNING: braces {} are not necessary for single statement blocks
#3105: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:1331:
+	if (request->ssids && request->ssids[0].ssid_len) {
+		memcpy(scan_req->ssid, request->ssids[0].ssid, MAX_SSID_LEN);
+	}

WARNING: Consider removing the code enclosed by this #if 0 and its #endif
#3109: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:1335:
+#if 0

WARNING: LINUX_VERSION_CODE should be avoided, code should be for the version to which it is merged
#3116: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:1342:
+#if LINUX_VERSION_CODE > KERNEL_VERSION(4, 8, 0)

WARNING: Comparisons should place the constant on the right side of the test
#3116: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:1342:
+#if LINUX_VERSION_CODE > KERNEL_VERSION(4, 8, 0)

WARNING: LINUX_VERSION_CODE should be avoided, code should be for the version to which it is merged
#3119: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:1345:
+#if LINUX_VERSION_CODE > KERNEL_VERSION(4, 7, 0)

WARNING: Comparisons should place the constant on the right side of the test
#3119: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:1345:
+#if LINUX_VERSION_CODE > KERNEL_VERSION(4, 7, 0)

CHECK: Please don't use multiple blank lines
#3134: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:1360:
+
+

WARNING: Statements terminations use 1 semicolon
#3166: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:1392:
+	struct cmd_config_mac_address *cmd;;

CHECK: No space is necessary after a cast
#3182: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:1408:
+	cmd = (struct cmd_config_mac_address *) (cmd_node->cmd_skb->data +

CHECK: Prefer kernel type 'u8' over 'uint8_t'
#3197: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:1423:
+	uint8_t iface_idx = 0;

WARNING: braces {} are not necessary for single statement blocks
#3200: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:1426:
+	if (!adapter) {
+		return -EINVAL;
+	}

CHECK: Please don't use multiple blank lines
#3209: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:1435:
+
+

CHECK: Blank lines aren't necessary after an open brace '{'
#3211: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:1437:
+	for (iface_idx = 0; iface_idx < ESP_MAX_INTERFACE; iface_idx++) {
+

WARNING: Statements terminations use 1 semicolon
#3257: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:1483:
+	struct cmd_set_get_val *val;;

CHECK: No space is necessary after a cast
#3273: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:1499:
+	val = (struct cmd_set_get_val *) (cmd_node->cmd_skb->data +

WARNING: line length of 102 exceeds 100 columns
#3360: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:1586:
+	cmd = (struct cmd_reg_domain *) (cmd_node->cmd_skb->data + sizeof(struct esp_payload_header));

CHECK: No space is necessary after a cast
#3360: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:1586:
+	cmd = (struct cmd_reg_domain *) (cmd_node->cmd_skb->data + sizeof(struct esp_payload_header));

WARNING: Prefer strscpy over strlcpy - see: https://github.com/KSPP/linux/issues/89
#3362: drivers/net/wireless/espressif/esp32-ng/esp_cmd.c:1588:
+	strlcpy(cmd->country_code, priv->country_code, MAX_COUNTRY_LEN);

WARNING: Improper SPDX comment style for 'drivers/net/wireless/espressif/esp32-ng/esp_cmd.h', please use '/*' instead
#3377: drivers/net/wireless/espressif/esp32-ng/esp_cmd.h:1:
+// SPDX-License-Identifier: GPL-2.0-only

WARNING: Missing or malformed SPDX-License-Identifier tag in line 1
#3377: drivers/net/wireless/espressif/esp32-ng/esp_cmd.h:1:
+// SPDX-License-Identifier: GPL-2.0-only

CHECK: Please don't use multiple blank lines
#3401: drivers/net/wireless/espressif/esp32-ng/esp_cmd.h:25:
+
+

CHECK: Alignment should match open parenthesis
#3408: drivers/net/wireless/espressif/esp32-ng/esp_cmd.h:32:
+int cmd_scan_request(struct esp_wifi_device *priv,
+		struct cfg80211_scan_request *request);

CHECK: Alignment should match open parenthesis
#3413: drivers/net/wireless/espressif/esp32-ng/esp_cmd.h:37:
+int cmd_connect_request(struct esp_wifi_device *priv,
+		struct cfg80211_connect_params *params);

CHECK: Alignment should match open parenthesis
#3415: drivers/net/wireless/espressif/esp32-ng/esp_cmd.h:39:
+int cmd_auth_request(struct esp_wifi_device *priv,
+		struct cfg80211_auth_request *req);

CHECK: Alignment should match open parenthesis
#3417: drivers/net/wireless/espressif/esp32-ng/esp_cmd.h:41:
+int cmd_assoc_request(struct esp_wifi_device *priv,
+		struct cfg80211_assoc_request *req);

WARNING: Improper SPDX comment style for 'drivers/net/wireless/espressif/esp32-ng/esp_if.h', please use '/*' instead
#3437: drivers/net/wireless/espressif/esp32-ng/esp_if.h:1:
+// SPDX-License-Identifier: GPL-2.0-only

WARNING: Missing or malformed SPDX-License-Identifier tag in line 1
#3437: drivers/net/wireless/espressif/esp32-ng/esp_if.h:1:
+// SPDX-License-Identifier: GPL-2.0-only

WARNING: Improper SPDX comment style for 'drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h', please use '/*' instead
#3466: drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:1:
+// SPDX-License-Identifier: GPL-2.0-only

WARNING: Missing or malformed SPDX-License-Identifier tag in line 1
#3466: drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:1:
+// SPDX-License-Identifier: GPL-2.0-only

WARNING: LINUX_VERSION_CODE should be avoided, code should be for the version to which it is merged
#3480: drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:15:
+#if (LINUX_VERSION_CODE < KERNEL_VERSION(3, 13, 0))

WARNING: Comparisons should place the constant on the right side of the test
#3480: drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:15:
+#if (LINUX_VERSION_CODE < KERNEL_VERSION(3, 13, 0))

WARNING: LINUX_VERSION_CODE should be avoided, code should be for the version to which it is merged
#3488: drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:23:
+#if LINUX_VERSION_CODE < KERNEL_VERSION(3, 14, 0)

WARNING: Comparisons should place the constant on the right side of the test
#3488: drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:23:
+#if LINUX_VERSION_CODE < KERNEL_VERSION(3, 14, 0)

WARNING: LINUX_VERSION_CODE should be avoided, code should be for the version to which it is merged
#3500: drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:35:
+#if (LINUX_VERSION_CODE < KERNEL_VERSION(3, 14, 0))

WARNING: Comparisons should place the constant on the right side of the test
#3500: drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:35:
+#if (LINUX_VERSION_CODE < KERNEL_VERSION(3, 14, 0))

WARNING: please, no spaces at the start of a line
#3502: drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:37:
+    int esp_cfg80211_mgmt_tx(struct wiphy *wiphy,                              \$

WARNING: please, no spaces at the start of a line
#3508: drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:43:
+    int esp_cfg80211_mgmt_tx(struct wiphy *wiphy,                              \$

CHECK: Please don't use multiple blank lines
#3513: drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:48:
+
+

WARNING: LINUX_VERSION_CODE should be avoided, code should be for the version to which it is merged
#3514: drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:49:
+#if LINUX_VERSION_CODE < KERNEL_VERSION(3, 17, 0)

WARNING: Comparisons should place the constant on the right side of the test
#3514: drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:49:
+#if LINUX_VERSION_CODE < KERNEL_VERSION(3, 17, 0)

WARNING: please, no spaces at the start of a line
#3516: drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:51:
+    alloc_netdev(size, name, setup)$

WARNING: please, no spaces at the start of a line
#3519: drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:54:
+    alloc_netdev(size, name, type, setup)$

CHECK: Please don't use multiple blank lines
#3522: drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:57:
+
+

WARNING: LINUX_VERSION_CODE should be avoided, code should be for the version to which it is merged
#3523: drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:58:
+#if LINUX_VERSION_CODE < KERNEL_VERSION(3, 18, 0)

WARNING: Comparisons should place the constant on the right side of the test
#3523: drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:58:
+#if LINUX_VERSION_CODE < KERNEL_VERSION(3, 18, 0)

WARNING: please, no spaces at the start of a line
#3526: drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:61:
+  cfg80211_inform_bss(wiphy, chan, bssid, tsf, \$

WARNING: please, no spaces at the start of a line
#3531: drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:66:
+  cfg80211_inform_bss(wiphy, chan, CFG80211_BSS_FTYPE_UNKNOWN, bssid, tsf, \$

CHECK: Please don't use multiple blank lines
#3535: drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:70:
+
+

WARNING: LINUX_VERSION_CODE should be avoided, code should be for the version to which it is merged
#3536: drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:71:
+#if LINUX_VERSION_CODE < KERNEL_VERSION(3, 18, 0)

WARNING: Comparisons should place the constant on the right side of the test
#3536: drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:71:
+#if LINUX_VERSION_CODE < KERNEL_VERSION(3, 18, 0)

WARNING: LINUX_VERSION_CODE should be avoided, code should be for the version to which it is merged
#3552: drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:87:
+#if LINUX_VERSION_CODE < KERNEL_VERSION(4, 2, 0)

WARNING: Comparisons should place the constant on the right side of the test
#3552: drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:87:
+#if LINUX_VERSION_CODE < KERNEL_VERSION(4, 2, 0)

WARNING: please, no spaces at the start of a line
#3554: drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:89:
+    cfg80211_disconnected(dev, reason, ie, ie_len, gfp)$

WARNING: please, no spaces at the start of a line
#3558: drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:93:
+      cfg80211_disconnected(dev, reason, ie, ie_len, locally_generated, gfp)$

WARNING: LINUX_VERSION_CODE should be avoided, code should be for the version to which it is merged
#3561: drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:96:
+#if (LINUX_VERSION_CODE < KERNEL_VERSION(4, 5, 0))

WARNING: Comparisons should place the constant on the right side of the test
#3561: drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:96:
+#if (LINUX_VERSION_CODE < KERNEL_VERSION(4, 5, 0))

WARNING: LINUX_VERSION_CODE should be avoided, code should be for the version to which it is merged
#3562: drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:97:
+    #if (LINUX_VERSION_CODE >= KERNEL_VERSION(2, 6, 34))

WARNING: Comparisons should place the constant on the right side of the test
#3562: drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:97:
+    #if (LINUX_VERSION_CODE >= KERNEL_VERSION(2, 6, 34))

ERROR: code indent should use tabs where possible
#3563: drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:98:
+        #define hci_skb_pkt_type(skb) bt_cb((skb))->pkt_type$

WARNING: LINUX_VERSION_CODE should be avoided, code should be for the version to which it is merged
#3569: drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:104:
+#if (LINUX_VERSION_CODE < KERNEL_VERSION(4, 8, 0))

WARNING: Comparisons should place the constant on the right side of the test
#3569: drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:104:
+#if (LINUX_VERSION_CODE < KERNEL_VERSION(4, 8, 0))

WARNING: LINUX_VERSION_CODE should be avoided, code should be for the version to which it is merged
#3570: drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:105:
+    #if (LINUX_VERSION_CODE >= KERNEL_VERSION(2, 6, 34))

WARNING: Comparisons should place the constant on the right side of the test
#3570: drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:105:
+    #if (LINUX_VERSION_CODE >= KERNEL_VERSION(2, 6, 34))

ERROR: code indent should use tabs where possible
#3571: drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:106:
+        #define HCI_PRIMARY HCI_BREDR$

CHECK: Please don't use multiple blank lines
#3577: drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:112:
+
+

WARNING: LINUX_VERSION_CODE should be avoided, code should be for the version to which it is merged
#3578: drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:113:
+#if LINUX_VERSION_CODE < KERNEL_VERSION(4, 8, 0)

WARNING: Comparisons should place the constant on the right side of the test
#3578: drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:113:
+#if LINUX_VERSION_CODE < KERNEL_VERSION(4, 8, 0)

CHECK: Avoid CamelCase: <PrIv>
#3580: drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:115:
+    #define ESP_MARK_SCAN_DONE(PrIv, abort) do {                               \

CHECK: Macro argument reuse 'PrIv' - possible side-effects?
#3580: drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:115:
+    #define ESP_MARK_SCAN_DONE(PrIv, abort) do {                               \
+									       \
+	if (PrIv->request) {                                                   \
+	    cfg80211_scan_done(PrIv->request, abort);                          \
+	    PrIv->request = NULL;                                              \
+	}                                                                      \
+									       \
+	PrIv->scan_in_progress = false;                                        \
+									       \
+    } while (0);

CHECK: Macro argument 'PrIv' may be better as '(PrIv)' to avoid precedence issues
#3580: drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:115:
+    #define ESP_MARK_SCAN_DONE(PrIv, abort) do {                               \
+									       \
+	if (PrIv->request) {                                                   \
+	    cfg80211_scan_done(PrIv->request, abort);                          \
+	    PrIv->request = NULL;                                              \
+	}                                                                      \
+									       \
+	PrIv->scan_in_progress = false;                                        \
+									       \
+    } while (0);

WARNING: do {} while (0) macros should not be semicolon terminated
#3580: drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:115:
+    #define ESP_MARK_SCAN_DONE(PrIv, abort) do {                               \
+									       \
+	if (PrIv->request) {                                                   \
+	    cfg80211_scan_done(PrIv->request, abort);                          \
+	    PrIv->request = NULL;                                              \
+	}                                                                      \
+									       \
+	PrIv->scan_in_progress = false;                                        \
+									       \
+    } while (0);

WARNING: suspect code indent for conditional statements (8, 12)
#3582: drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:117:
+	if (PrIv->request) {                                                   \
+	    cfg80211_scan_done(PrIv->request, abort);                          \

WARNING: please, no spaces at the start of a line
#3589: drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:124:
+    } while (0);$

CHECK: Macro argument reuse 'PrIv' - possible side-effects?
#3593: drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:128:
+    #define ESP_MARK_SCAN_DONE(PrIv, abort) do {                               \
+									       \
+	struct cfg80211_scan_info info = {                                     \
+	    .aborted = abort,                                                  \
+	};                                                                     \
+									       \
+	if (PrIv->request) {                                                   \
+	    cfg80211_scan_done(PrIv->request, &info);                          \
+	    PrIv->request = NULL;                                              \
+	}                                                                      \
+									       \
+	PrIv->scan_in_progress = false;                                        \
+									       \
+    } while (0);

CHECK: Macro argument 'PrIv' may be better as '(PrIv)' to avoid precedence issues
#3593: drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:128:
+    #define ESP_MARK_SCAN_DONE(PrIv, abort) do {                               \
+									       \
+	struct cfg80211_scan_info info = {                                     \
+	    .aborted = abort,                                                  \
+	};                                                                     \
+									       \
+	if (PrIv->request) {                                                   \
+	    cfg80211_scan_done(PrIv->request, &info);                          \
+	    PrIv->request = NULL;                                              \
+	}                                                                      \
+									       \
+	PrIv->scan_in_progress = false;                                        \
+									       \
+    } while (0);

WARNING: do {} while (0) macros should not be semicolon terminated
#3593: drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:128:
+    #define ESP_MARK_SCAN_DONE(PrIv, abort) do {                               \
+									       \
+	struct cfg80211_scan_info info = {                                     \
+	    .aborted = abort,                                                  \
+	};                                                                     \
+									       \
+	if (PrIv->request) {                                                   \
+	    cfg80211_scan_done(PrIv->request, &info);                          \
+	    PrIv->request = NULL;                                              \
+	}                                                                      \
+									       \
+	PrIv->scan_in_progress = false;                                        \
+									       \
+    } while (0);

WARNING: suspect code indent for conditional statements (8, 12)
#3599: drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:134:
+	if (PrIv->request) {                                                   \
+	    cfg80211_scan_done(PrIv->request, &info);                          \

WARNING: please, no spaces at the start of a line
#3606: drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:141:
+    } while (0);$

WARNING: LINUX_VERSION_CODE should be avoided, code should be for the version to which it is merged
#3610: drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:145:
+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(4, 12, 0))

WARNING: Comparisons should place the constant on the right side of the test
#3610: drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:145:
+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(4, 12, 0))

WARNING: macros should not use a trailing semicolon
#3611: drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:146:
+    #define ESP_CANCEL_SCHED_SCAN() cfg80211_sched_scan_stopped(priv->wdev.wiphy, 0);

WARNING: macros should not use a trailing semicolon
#3613: drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:148:
+    #define ESP_CANCEL_SCHED_SCAN() cfg80211_sched_scan_stopped(priv->wdev.wiphy);

WARNING: LINUX_VERSION_CODE should be avoided, code should be for the version to which it is merged
#3616: drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:151:
+#if LINUX_VERSION_CODE < KERNEL_VERSION(4, 13, 0)

WARNING: Comparisons should place the constant on the right side of the test
#3616: drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:151:
+#if LINUX_VERSION_CODE < KERNEL_VERSION(4, 13, 0)

WARNING: LINUX_VERSION_CODE should be avoided, code should be for the version to which it is merged
#3628: drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:163:
+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(5, 17, 0))

WARNING: Comparisons should place the constant on the right side of the test
#3628: drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:163:
+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(5, 17, 0))

WARNING: LINUX_VERSION_CODE should be avoided, code should be for the version to which it is merged
#3632: drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:167:
+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(5, 18, 0))

WARNING: Comparisons should place the constant on the right side of the test
#3632: drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:167:
+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(5, 18, 0))

WARNING: LINUX_VERSION_CODE should be avoided, code should be for the version to which it is merged
#3645: drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:180:
+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 0, 0))

WARNING: Comparisons should place the constant on the right side of the test
#3645: drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:180:
+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 0, 0))

WARNING: LINUX_VERSION_CODE should be avoided, code should be for the version to which it is merged
#3657: drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:192:
+	#if (LINUX_VERSION_CODE >= KERNEL_VERSION(5, 0, 21))

WARNING: Comparisons should place the constant on the right side of the test
#3657: drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:192:
+	#if (LINUX_VERSION_CODE >= KERNEL_VERSION(5, 0, 21))

CHECK: Please don't use multiple blank lines
#3665: drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:200:
+
+

WARNING: LINUX_VERSION_CODE should be avoided, code should be for the version to which it is merged
#3666: drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:201:
+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 1, 0))

WARNING: Comparisons should place the constant on the right side of the test
#3666: drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:201:
+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 1, 0))

CHECK: Please use a blank line after function/struct/union/enum declarations
#3673: drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:208:
+}
+#define INT_LINK_ID int link_id,

CHECK: Please use a blank line after function/struct/union/enum declarations
#3682: drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:217:
+}
+#define INT_LINK_ID

WARNING: LINUX_VERSION_CODE should be avoided, code should be for the version to which it is merged
#3686: drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:221:
+#if (LINUX_VERSION_CODE < KERNEL_VERSION(5, 15, 0))

WARNING: Comparisons should place the constant on the right side of the test
#3686: drivers/net/wireless/espressif/esp32-ng/esp_kernel_port.h:221:
+#if (LINUX_VERSION_CODE < KERNEL_VERSION(5, 15, 0))

WARNING: Missing or malformed SPDX-License-Identifier tag in line 1
#3700: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:1:
+/*

WARNING: Misplaced SPDX-License-Identifier tag - use line 1 instead
#3705: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:6:
+ * SPDX-License-Identifier: GPL-2.0-only

CHECK: spaces preferred around that '/' (ctx:VxV)
#3724: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:25:
+#define TX_RESUME_THRESHOLD     (TX_MAX_PENDING_COUNT/5)
                                                      ^

WARNING: do {} while (0) macros should not be semicolon terminated
#3726: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:27:
+#define CHECK_SDIO_RW_ERROR(ret) do {			\
+	if (ret)						\
+	esp_err("CMD53 read/write error at %d\n", __LINE__);	\
+} while (0);

WARNING: suspect code indent for conditional statements (8, 8)
#3727: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:28:
+	if (ret)						\
+	esp_err("CMD53 read/write error at %d\n", __LINE__);	\

WARNING: Use of volatile is usually wrong: see Documentation/process/volatile-considered-harmful.rst
#3740: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:41:
+volatile u8 host_sleep;

WARNING: braces {} are not necessary for single statement blocks
#3755: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:56:
+	if (!context) {
+		return;
+	}

WARNING: braces {} are not necessary for single statement blocks
#3759: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:60:
+	if (int_status & ESP_SLAVE_RX_NEW_PACKET_INT) {
+		esp_process_new_packet_intr(context->adapter);
+	}

WARNING: braces {} are not necessary for single statement blocks
#3770: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:71:
+	if (!func) {
+		return;
+	}

WARNING: braces {} are not necessary for single statement blocks
#3779: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:80:
+	if (!context) {
+		return;
+	}

WARNING: braces {} are not necessary for single statement blocks
#3785: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:86:
+	if (!int_status) {
+		return;
+	}

CHECK: Alignment should match open parenthesis
#3791: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:92:
+	ret = esp_read_reg(context, ESP_SLAVE_INT_ST_REG,
+			(u8 *) int_status, sizeof(*int_status), ACQUIRE_LOCK);

CHECK: No space is necessary after a cast
#3791: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:92:
+			(u8 *) int_status, sizeof(*int_status), ACQUIRE_LOCK);

CHECK: Alignment should match open parenthesis
#3798: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:99:
+	ret = esp_write_reg(context, ESP_SLAVE_INT_CLR_REG,
+			(u8 *) int_status, sizeof(*int_status), ACQUIRE_LOCK);

CHECK: No space is necessary after a cast
#3798: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:99:
+			(u8 *) int_status, sizeof(*int_status), ACQUIRE_LOCK);

WARNING: braces {} are not necessary for single statement blocks
#3814: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:115:
+	if (!val) {
+		return -ENOMEM;
+	}

CHECK: Alignment should match open parenthesis
#3821: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:122:
+	ret = esp_write_reg(context, ESP_SLAVE_SCRATCH_REG_7, val,
+			sizeof(*val), ACQUIRE_LOCK);

WARNING: line length of 104 exceeds 100 columns
#3839: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:140:
+static int esp_slave_get_tx_buffer_num(struct esp_sdio_context *context, u32 *tx_num, u8 is_lock_needed)

WARNING: braces {} are not necessary for single statement blocks
#3846: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:147:
+	if (!len) {
+		return -ENOMEM;
+	}

WARNING: line length of 101 exceeds 100 columns
#3850: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:151:
+	ret = esp_read_reg(context, ESP_SLAVE_TOKEN_RDATA, (u8 *) len, sizeof(*len), is_lock_needed);

CHECK: No space is necessary after a cast
#3850: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:151:
+	ret = esp_read_reg(context, ESP_SLAVE_TOKEN_RDATA, (u8 *) len, sizeof(*len), is_lock_needed);

WARNING: braces {} are not necessary for single statement blocks
#3874: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:175:
+	if (!len) {
+		return -ENOMEM;
+	}

CHECK: Alignment should match open parenthesis
#3879: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:180:
+	ret = esp_read_reg(context, ESP_SLAVE_PACKET_LEN_REG,
+			(u8 *) len, sizeof(*len), is_lock_needed);

CHECK: No space is necessary after a cast
#3879: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:180:
+			(u8 *) len, sizeof(*len), is_lock_needed);

CHECK: braces {} should be used on all arms of this statement
#3888: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:189:
+	if (*len >= context->rx_byte_count)
[...]
+	else {
[...]

CHECK: Unbalanced braces around else statement
#3890: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:191:
+	else {

CHECK: Alignment should match open parenthesis
#3897: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:198:
+			esp_info("Len from slave[%d] exceeds max [%d]\n",
+					*len, ESP_RX_BUFFER_SIZE);

CHECK: Please don't use multiple blank lines
#3906: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:207:
+
+

WARNING: Consider removing the code enclosed by this #if 0 and its #endif
#3907: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:208:
+#if 0

WARNING: braces {} are not necessary for single statement blocks
#3918: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:219:
+		if (!skb) {
+			break;
+		}

CHECK: Prefer kernel type 'u8' over 'uint8_t'
#3933: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:234:
+	uint8_t prio_q_idx = 0;

CHECK: Unnecessary parentheses around sdio_context.tx_q[prio_q_idx]
#3944: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:245:
+			skb_queue_purge(&(sdio_context.tx_q[prio_q_idx]));

WARNING: braces {} are not necessary for single statement blocks
#3959: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:260:
+			if (context->adapter->hcidev) {
+				esp_deinit_bt(context->adapter);
+			}

CHECK: Please don't use multiple blank lines
#3964: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:265:
+
+

WARNING: braces {} are not necessary for single statement blocks
#3985: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:286:
+	if (!val) {
+		return -ENOMEM;
+	}

CHECK: Alignment should match open parenthesis
#3991: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:292:
+	ret = esp_read_reg(context, ESP_SLAVE_PACKET_LEN_REG,
+			(u8 *) val, sizeof(*val), ACQUIRE_LOCK);

CHECK: No space is necessary after a cast
#3991: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:292:
+			(u8 *) val, sizeof(*val), ACQUIRE_LOCK);

CHECK: No space is necessary after a cast
#4002: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:303:
+	ret = esp_read_reg(context, ESP_SLAVE_TOKEN_RDATA, (u8 *) val,

CHECK: Alignment should match open parenthesis
#4003: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:304:
+	ret = esp_read_reg(context, ESP_SLAVE_TOKEN_RDATA, (u8 *) val,
+			sizeof(*val), ACQUIRE_LOCK);

CHECK: Prefer kernel type 'u8' over 'uint8_t'
#4026: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:327:
+	uint8_t prio_q_idx = 0;

WARNING: braces {} are not necessary for single statement blocks
#4028: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:329:
+	if (!context) {
+		return -EINVAL;
+	}

CHECK: Unnecessary parentheses around sdio_context.tx_q[prio_q_idx]
#4042: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:343:
+		skb_queue_head_init(&(sdio_context.tx_q[prio_q_idx]));

CHECK: Unnecessary parentheses around 'context->state != ESP_CONTEXT_READY'
#4066: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:367:
+	if (!context ||  (context->state != ESP_CONTEXT_READY) || !context->func) {

CHECK: multiple assignments should be avoided
#4073: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:374:
+	data_left = len_to_read = len_from_slave = num_blocks = 0;

WARNING: braces {} are not necessary for single statement blocks
#4085: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:386:
+	if (len_from_slave > size) {
+		esp_info("Rx large packet: %d\n", len_from_slave);
+	}

WARNING: Possible unnecessary 'out of memory' message
#4092: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:393:
+	if (!skb) {
+		esp_err("SKB alloc failed\n");

CHECK: spaces preferred around that '/' (ctx:VxV)
#4103: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:404:
+		num_blocks = data_left/ESP_BLOCK_SIZE;
 		                      ^

WARNING: Consider removing the code enclosed by this #if 0 and its #endif
#4105: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:406:
+#if 0

WARNING: braces {} are not necessary for single statement blocks
#4106: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:407:
+		if (!context->rx_byte_count) {
+			start_time = ktime_get_ns();
+		}

CHECK: Alignment should match open parenthesis
#4114: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:415:
+			ret = esp_read_block(context,
+					ESP_SLAVE_CMD53_END_ADDR - len_to_read,

CHECK: Alignment should match open parenthesis
#4120: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:421:
+			ret = esp_read_block(context,
+					ESP_SLAVE_CMD53_END_ADDR - len_to_read,

WARNING: line length of 102 exceeds 100 columns
#4125: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:426:
+			esp_err("Failed to read data - %d [%u - %d]\n", ret, num_blocks, len_to_read);

CHECK: No space is necessary after a cast
#4147: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:448:
+	struct esp_payload_header *payload_header = (struct esp_payload_header *) skb->data;

CHECK: Prefer kernel type 'u8' over 'uint8_t'
#4149: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:450:
+	uint8_t prio = PRIO_Q_LOW;

CHECK: Alignment should match open parenthesis
#4163: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:464:
+		esp_err("Drop pkt of len[%u] > max SDIO transport len[%u]\n",
+				skb->len, max_pkt_size);

CHECK: Unnecessary parentheses around sdio_context.tx_q[prio]
#4190: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:491:
+	skb_queue_tail(&(sdio_context.tx_q[prio]), skb);

WARNING: Block comments use * on subsequent lines
#4206: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:507:
+	/*If buffer needed are less than buffer available
+	  then only read for available buffer number from slave*/

WARNING: Block comments use a trailing */ on a separate line
#4206: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:507:
+	  then only read for available buffer number from slave*/

CHECK: Blank lines aren't necessary after an open brace '{'
#4212: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:513:
+			if (buf_available < buf_needed) {
+

CHECK: No space is necessary after a cast
#4242: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:543:
+	struct esp_adapter *adapter = (struct esp_adapter *) data;

CHECK: Blank lines aren't necessary after an open brace '{'
#4250: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:551:
+	while (!kthread_should_stop()) {
+

WARNING: msleep < 20ms can sleep for up to 20ms; see Documentation/timers/timers-howto.rst
#4252: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:553:
+			msleep(10);

CHECK: Unnecessary parentheses around context->tx_q[PRIO_Q_HIGH]
#4264: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:565:
+			tx_skb = skb_dequeue(&(context->tx_q[PRIO_Q_HIGH]));

WARNING: braces {} are not necessary for single statement blocks
#4265: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:566:
+			if (!tx_skb) {
+				continue;
+			}

CHECK: Unnecessary parentheses around context->tx_q[PRIO_Q_MID]
#4270: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:571:
+			tx_skb = skb_dequeue(&(context->tx_q[PRIO_Q_MID]));

WARNING: braces {} are not necessary for single statement blocks
#4271: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:572:
+			if (!tx_skb) {
+				continue;
+			}

CHECK: Unnecessary parentheses around context->tx_q[PRIO_Q_LOW]
#4276: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:577:
+			tx_skb = skb_dequeue(&(context->tx_q[PRIO_Q_LOW]));

WARNING: braces {} are not necessary for single statement blocks
#4277: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:578:
+			if (!tx_skb) {
+				continue;
+			}

WARNING: Consider removing the code enclosed by this #if 0 and its #endif
#4282: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:583:
+#if 0

CHECK: Alignment should match open parenthesis
#4284: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:585:
+			esp_err("not ready 2 [%d %d]\n",
+					atomic_read(&queue_items[PRIO_Q_OTHERS]),

WARNING: msleep < 20ms can sleep for up to 20ms; see Documentation/timers/timers-howto.rst
#4287: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:588:
+			msleep(1);

WARNING: Block comments use * on subsequent lines
#4308: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:609:
+		/*If SDIO slave buffer is available to write then only write data
+		else wait till buffer is available*/

WARNING: Block comments use a trailing */ on a separate line
#4308: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:609:
+		else wait till buffer is available*/

CHECK: multiple assignments should be avoided
#4316: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:617:
+		data_left = len_to_send = 0;

CHECK: Please don't use multiple blank lines
#4322: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:623:
+
+

CHECK: Alignment should match open parenthesis
#4327: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:628:
+			ret = esp_write_block(context, ESP_SLAVE_CMD53_END_ADDR - len_to_send,
+					pos, (len_to_send + 3) & (~3), ACQUIRE_LOCK);

WARNING: line length of 104 exceeds 100 columns
#4330: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:631:
+				esp_err("Failed to send data: %d %d %d\n", ret, len_to_send, data_left);

WARNING: braces {} are not necessary for single statement blocks
#4371: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:672:
+	if (ret) {
+		return NULL;
+	}

CHECK: No space is necessary after a cast
#4396: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:697:
+	struct esp_sdio_context *context = (struct esp_sdio_context *) data;

CHECK: multiple assignments should be avoided
#4402: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:703:
+		val = intr = len_reg = rdata = 0;

CHECK: Alignment should match open parenthesis
#4405: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:706:
+		esp_read_reg(context, ESP_SLAVE_PACKET_LEN_REG,
+				(u8 *) &val, sizeof(val), ACQUIRE_LOCK);

CHECK: No space is necessary after a cast
#4405: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:706:
+				(u8 *) &val, sizeof(val), ACQUIRE_LOCK);

CHECK: No space is necessary after a cast
#4410: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:711:
+		esp_read_reg(context, ESP_SLAVE_TOKEN_RDATA, (u8 *) &val,

CHECK: Alignment should match open parenthesis
#4411: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:712:
+		esp_read_reg(context, ESP_SLAVE_TOKEN_RDATA, (u8 *) &val,
+				sizeof(val), ACQUIRE_LOCK);

CHECK: Alignment should match open parenthesis
#4416: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:717:
+		esp_read_reg(context, ESP_SLAVE_INT_ST_REG,
+				(u8 *) &intr, sizeof(intr), ACQUIRE_LOCK);

CHECK: No space is necessary after a cast
#4416: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:717:
+				(u8 *) &intr, sizeof(intr), ACQUIRE_LOCK);

CHECK: Please don't use multiple blank lines
#4418: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:719:
+
+

CHECK: Unnecessary parentheses around 'context->rx_byte_count == old_len'
#4420: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:721:
+			if (old_len && (context->rx_byte_count == old_len)) {

CHECK: Alignment should match open parenthesis
#4422: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:723:
+				esp_dbg("Monitor thread ----> [%d - %d] [%d - %d] %d\n",
+						len_reg, context->rx_byte_count,

CHECK: Alignment should match open parenthesis
#4448: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:749:
+static int esp_probe(struct sdio_func *func,
+				  const struct sdio_device_id *id)

WARNING: braces {} are not necessary for single statement blocks
#4453: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:754:
+	if (func->num != 1) {
+		return -EINVAL;
+	}

WARNING: braces {} are not necessary for single statement blocks
#4461: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:762:
+	if (!context) {
+		return -ENOMEM;
+	}

CHECK: Please don't use multiple blank lines
#4481: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:782:
+
+

WARNING: msleep < 20ms can sleep for up to 20ms; see Documentation/timers/timers-howto.rst
#4517: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:818:
+	msleep(10);

WARNING: Consider removing the code enclosed by this #if 0 and its #endif
#4520: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:821:
+#if 0

WARNING: Consider removing the code enclosed by this #if 0 and its #endif
#4541: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:842:
+#if 0

CHECK: Please don't use multiple blank lines
#4547: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:848:
+
+

CHECK: Blank lines aren't necessary after an open brace '{'
#4613: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:914:
+		if (*pos == ESP_BOOTUP_CAPABILITY) {
+

CHECK: Blank lines aren't necessary after an open brace '{'
#4619: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:920:
+		} else if (*pos == ESP_BOOTUP_FIRMWARE_CHIP_ID) {
+

CHECK: Alignment should match open parenthesis
#4621: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:922:
+			esp_info("ESP chipset detected [%s]\n",
+				*(pos+2) == ESP_FIRMWARE_CHIP_ESP32 ? "esp32" :

CHECK: spaces preferred around that '+' (ctx:VxV)
#4621: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:922:
+				*(pos+2) == ESP_FIRMWARE_CHIP_ESP32 ? "esp32" :
 				     ^

CHECK: spaces preferred around that '+' (ctx:VxV)
#4622: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:923:
+				*(pos+2) == ESP_FIRMWARE_CHIP_ESP32S2 ? "esp32-s2" :
 				     ^

CHECK: spaces preferred around that '+' (ctx:VxV)
#4623: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:924:
+				*(pos+2) == ESP_FIRMWARE_CHIP_ESP32C3 ? "esp32-c3" :
 				     ^

CHECK: spaces preferred around that '+' (ctx:VxV)
#4624: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:925:
+				*(pos+2) == ESP_FIRMWARE_CHIP_ESP32S3 ? "esp32-s3" :
 				     ^

CHECK: spaces preferred around that '+' (ctx:VxV)
#4627: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:928:
+			if (*(pos+2) != ESP_FIRMWARE_CHIP_ESP32)
 			         ^

CHECK: Blank lines aren't necessary after an open brace '{'
#4634: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:935:
+		} else if (*pos == ESP_BOOTUP_FW_DATA) {
+

WARNING: line length of 103 exceeds 100 columns
#4640: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:941:
+						generate_slave_intr(context, BIT(ESP_CLOSE_DATA_PATH));

CHECK: spaces preferred around that '+' (ctx:VxV)
#4648: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:949:
+		pos += (tag_len+2);
 		               ^

CHECK: spaces preferred around that '+' (ctx:VxV)
#4649: drivers/net/wireless/espressif/esp32-ng/esp_sdio.c:950:
+		len_left -= (tag_len+2);
 		                    ^

WARNING: Missing or malformed SPDX-License-Identifier tag in line 1
#4668: drivers/net/wireless/espressif/esp32-ng/esp_sdio_api.c:1:
+/*

WARNING: Misplaced SPDX-License-Identifier tag - use line 1 instead
#4673: drivers/net/wireless/espressif/esp32-ng/esp_sdio_api.c:6:
+ * SPDX-License-Identifier: GPL-2.0-only

WARNING: line length of 112 exceeds 100 columns
#4729: drivers/net/wireless/espressif/esp32-ng/esp_sdio_api.c:62:
+static int esp_read_multi_byte(struct esp_sdio_context *context, u32 reg, u8 *data, u16 size, u8 is_lock_needed)

WARNING: line length of 113 exceeds 100 columns
#4752: drivers/net/wireless/espressif/esp32-ng/esp_sdio_api.c:85:
+static int esp_write_multi_byte(struct esp_sdio_context *context, u32 reg, u8 *data, u16 size, u8 is_lock_needed)

WARNING: braces {} are not necessary for any arm of this statement
#4780: drivers/net/wireless/espressif/esp32-ng/esp_sdio_api.c:113:
+	if (size <= 1) {
[...]
+	} else {
[...]

WARNING: braces {} are not necessary for any arm of this statement
#4789: drivers/net/wireless/espressif/esp32-ng/esp_sdio_api.c:122:
+	if (size <= 1) {
[...]
+	} else {
[...]

WARNING: braces {} are not necessary for any arm of this statement
#4801: drivers/net/wireless/espressif/esp32-ng/esp_sdio_api.c:134:
+	if (size <= 1) {
[...]
+	} else {
[...]

WARNING: line length of 101 exceeds 100 columns
#4808: drivers/net/wireless/espressif/esp32-ng/esp_sdio_api.c:141:
+int esp_write_block(struct esp_sdio_context *context, u32 reg, u8 *data, u16 size, u8 is_lock_needed)

WARNING: braces {} are not necessary for any arm of this statement
#4810: drivers/net/wireless/espressif/esp32-ng/esp_sdio_api.c:143:
+	if (size <= 1) {
[...]
+	} else {
[...]

WARNING: Missing or malformed SPDX-License-Identifier tag in line 1
#4823: drivers/net/wireless/espressif/esp32-ng/esp_sdio_api.h:1:
+/*

WARNING: Misplaced SPDX-License-Identifier tag - use line 1 instead
#4828: drivers/net/wireless/espressif/esp32-ng/esp_sdio_api.h:6:
+ * SPDX-License-Identifier: GPL-2.0-only

WARNING: line length of 101 exceeds 100 columns
#4835: drivers/net/wireless/espressif/esp32-ng/esp_sdio_api.h:13:
+int esp_read_block(struct esp_sdio_context *context, u32 reg, u8 *data, u16 size, u8 is_lock_needed);

WARNING: line length of 102 exceeds 100 columns
#4837: drivers/net/wireless/espressif/esp32-ng/esp_sdio_api.h:15:
+int esp_write_block(struct esp_sdio_context *context, u32 reg, u8 *data, u16 size, u8 is_lock_needed);

WARNING: Missing or malformed SPDX-License-Identifier tag in line 1
#4846: drivers/net/wireless/espressif/esp32-ng/esp_sdio_decl.h:1:
+/*

WARNING: Misplaced SPDX-License-Identifier tag - use line 1 instead
#4851: drivers/net/wireless/espressif/esp32-ng/esp_sdio_decl.h:6:
+ * SPDX-License-Identifier: GPL-2.0-only

CHECK: Please don't use multiple blank lines
#4871: drivers/net/wireless/espressif/esp32-ng/esp_sdio_decl.h:26:
+
+

CHECK: Please don't use multiple blank lines
#4917: drivers/net/wireless/espressif/esp32-ng/esp_sdio_decl.h:72:
+
+

WARNING: Missing or malformed SPDX-License-Identifier tag in line 1
#4940: drivers/net/wireless/espressif/esp32-ng/esp_spi.c:1:
+/*

WARNING: Misplaced SPDX-License-Identifier tag - use line 1 instead
#4943: drivers/net/wireless/espressif/esp32-ng/esp_spi.c:4:
+ * SPDX-License-Identifier: GPL-2.0-only

CHECK: spaces preferred around that '/' (ctx:VxV)
#4960: drivers/net/wireless/espressif/esp32-ng/esp_spi.c:21:
+#define TX_RESUME_THRESHOLD     (TX_MAX_PENDING_COUNT/5)
                                                      ^

WARNING: Use of volatile is usually wrong: see Documentation/process/volatile-considered-harmful.rst
#4968: drivers/net/wireless/espressif/esp32-ng/esp_spi.c:29:
+volatile u8 data_path;

WARNING: Use of volatile is usually wrong: see Documentation/process/volatile-considered-harmful.rst
#4969: drivers/net/wireless/espressif/esp32-ng/esp_spi.c:30:
+volatile u8 host_sleep;

CHECK: Prefer kernel type 'u8' over 'uint8_t'
#4973: drivers/net/wireless/espressif/esp32-ng/esp_spi.c:34:
+static uint8_t esp_reset_after_module_load;

WARNING: please, no spaces at the start of a line
#5002: drivers/net/wireless/espressif/esp32-ng/esp_spi.c:63:
+ }$

WARNING: braces {} are not necessary for single statement blocks
#5018: drivers/net/wireless/espressif/esp32-ng/esp_spi.c:79:
+	if (!data_path) {
+		return NULL;
+	}

CHECK: Unnecessary parentheses around context->rx_q[PRIO_Q_HIGH]
#5030: drivers/net/wireless/espressif/esp32-ng/esp_spi.c:91:
+		skb = skb_dequeue(&(context->rx_q[PRIO_Q_HIGH]));

CHECK: Unnecessary parentheses around context->rx_q[PRIO_Q_MID]
#5032: drivers/net/wireless/espressif/esp32-ng/esp_spi.c:93:
+			skb = skb_dequeue(&(context->rx_q[PRIO_Q_MID]));

CHECK: Unnecessary parentheses around context->rx_q[PRIO_Q_LOW]
#5034: drivers/net/wireless/espressif/esp32-ng/esp_spi.c:95:
+			skb = skb_dequeue(&(context->rx_q[PRIO_Q_LOW]));

CHECK: No space is necessary after a cast
#5046: drivers/net/wireless/espressif/esp32-ng/esp_spi.c:107:
+	struct esp_payload_header *payload_header = (struct esp_payload_header *) skb->data;

CHECK: Alignment should match open parenthesis
#5060: drivers/net/wireless/espressif/esp32-ng/esp_spi.c:121:
+		esp_err("Drop pkt of len[%u] > max spi transport len[%u]\n",
+				skb->len, max_pkt_size);

CHECK: Prefer kernel type 'u8' over 'uint8_t'
#5107: drivers/net/wireless/espressif/esp32-ng/esp_spi.c:168:
+	uint8_t iface_idx = 0;

CHECK: Prefer kernel type 'u8' over 'uint8_t'
#5108: drivers/net/wireless/espressif/esp32-ng/esp_spi.c:169:
+	uint8_t prio_q_idx = 0;

CHECK: Blank lines aren't necessary after an open brace '{'
#5123: drivers/net/wireless/espressif/esp32-ng/esp_spi.c:184:
+	while (len_left) {
+

CHECK: Blank lines aren't necessary after an open brace '{'
#5129: drivers/net/wireless/espressif/esp32-ng/esp_spi.c:190:
+		if (*pos == ESP_BOOTUP_CAPABILITY) {
+

CHECK: Blank lines aren't necessary after an open brace '{'
#5133: drivers/net/wireless/espressif/esp32-ng/esp_spi.c:194:
+		} else if (*pos == ESP_BOOTUP_FW_DATA) {
+

CHECK: Blank lines aren't necessary after an open brace '{'
#5143: drivers/net/wireless/espressif/esp32-ng/esp_spi.c:204:
+		} else if (*pos == ESP_BOOTUP_SPI_CLK_MHZ) {
+

CHECK: Blank lines aren't necessary after an open brace '{'
#5148: drivers/net/wireless/espressif/esp32-ng/esp_spi.c:209:
+		} else if (*pos == ESP_BOOTUP_FIRMWARE_CHIP_ID) {
+

CHECK: spaces preferred around that '+' (ctx:VxV)
#5149: drivers/net/wireless/espressif/esp32-ng/esp_spi.c:210:
+			hardware_type = *(pos+2);
 			                     ^

CHECK: spaces preferred around that '+' (ctx:VxV)
#5157: drivers/net/wireless/espressif/esp32-ng/esp_spi.c:218:
+		pos += (tag_len+2);
 		               ^

CHECK: spaces preferred around that '+' (ctx:VxV)
#5158: drivers/net/wireless/espressif/esp32-ng/esp_spi.c:219:
+		len_left -= (tag_len+2);
 		                    ^

CHECK: Unnecessary parentheses around 'hardware_type != ESP_FIRMWARE_CHIP_ESP32'
#5161: drivers/net/wireless/espressif/esp32-ng/esp_spi.c:222:
+	if ((hardware_type != ESP_FIRMWARE_CHIP_ESP32) &&
+	    (hardware_type != ESP_FIRMWARE_CHIP_ESP32S2) &&
+	    (hardware_type != ESP_FIRMWARE_CHIP_ESP32C3) &&
+	    (hardware_type != ESP_FIRMWARE_CHIP_ESP32S3)) {

CHECK: Unnecessary parentheses around 'hardware_type != ESP_FIRMWARE_CHIP_ESP32S2'
#5161: drivers/net/wireless/espressif/esp32-ng/esp_spi.c:222:
+	if ((hardware_type != ESP_FIRMWARE_CHIP_ESP32) &&
+	    (hardware_type != ESP_FIRMWARE_CHIP_ESP32S2) &&
+	    (hardware_type != ESP_FIRMWARE_CHIP_ESP32C3) &&
+	    (hardware_type != ESP_FIRMWARE_CHIP_ESP32S3)) {

CHECK: Unnecessary parentheses around 'hardware_type != ESP_FIRMWARE_CHIP_ESP32C3'
#5161: drivers/net/wireless/espressif/esp32-ng/esp_spi.c:222:
+	if ((hardware_type != ESP_FIRMWARE_CHIP_ESP32) &&
+	    (hardware_type != ESP_FIRMWARE_CHIP_ESP32S2) &&
+	    (hardware_type != ESP_FIRMWARE_CHIP_ESP32C3) &&
+	    (hardware_type != ESP_FIRMWARE_CHIP_ESP32S3)) {

CHECK: Unnecessary parentheses around 'hardware_type != ESP_FIRMWARE_CHIP_ESP32S3'
#5161: drivers/net/wireless/espressif/esp32-ng/esp_spi.c:222:
+	if ((hardware_type != ESP_FIRMWARE_CHIP_ESP32) &&
+	    (hardware_type != ESP_FIRMWARE_CHIP_ESP32S2) &&
+	    (hardware_type != ESP_FIRMWARE_CHIP_ESP32C3) &&
+	    (hardware_type != ESP_FIRMWARE_CHIP_ESP32S3)) {

CHECK: Alignment should match open parenthesis
#5169: drivers/net/wireless/espressif/esp32-ng/esp_spi.c:230:
+		esp_info("ESP chipset detected [%s]\n",
+				hardware_type == ESP_FIRMWARE_CHIP_ESP32 ? "esp32" :

CHECK: Blank lines aren't necessary after an open brace '{'
#5177: drivers/net/wireless/espressif/esp32-ng/esp_spi.c:238:
+	if (esp_reset_after_module_load) {
+

WARNING: braces {} are not necessary for single statement blocks
#5195: drivers/net/wireless/espressif/esp32-ng/esp_spi.c:256:
+		for (prio_q_idx = 0; prio_q_idx < MAX_PRIORITY_QUEUES; prio_q_idx++) {
+			skb_queue_purge(&spi_context.tx_q[prio_q_idx]);
+		}

CHECK: Blank lines aren't necessary after an open brace '{'
#5200: drivers/net/wireless/espressif/esp32-ng/esp_spi.c:261:
+		for (iface_idx = 0; iface_idx < ESP_MAX_INTERFACE; iface_idx++) {
+

CHECK: Alignment should match open parenthesis
#5212: drivers/net/wireless/espressif/esp32-ng/esp_spi.c:273:
+				CFG80211_DISCONNECTED(priv->ndev,
+						0, NULL, 0, false, GFP_KERNEL);

WARNING: braces {} are not necessary for single statement blocks
#5218: drivers/net/wireless/espressif/esp32-ng/esp_spi.c:279:
+		for (prio_q_idx = 0; prio_q_idx < MAX_PRIORITY_QUEUES; prio_q_idx++) {
+			skb_queue_head_init(&spi_context.tx_q[prio_q_idx]);
+		}

WARNING: braces {} are not necessary for single statement blocks
#5223: drivers/net/wireless/espressif/esp32-ng/esp_spi.c:284:
+	if (esp_add_card(adapter)) {
+		esp_err("network iterface init failed\n");
+	}

CHECK: Please don't use multiple blank lines
#5230: drivers/net/wireless/espressif/esp32-ng/esp_spi.c:291:
+
+

CHECK: Please don't use multiple blank lines
#5234: drivers/net/wireless/espressif/esp32-ng/esp_spi.c:295:
+
+

CHECK: No space is necessary after a cast
#5244: drivers/net/wireless/espressif/esp32-ng/esp_spi.c:305:
+	header = (struct esp_payload_header *) skb->data;

WARNING: braces {} are not necessary for single statement blocks
#5246: drivers/net/wireless/espressif/esp32-ng/esp_spi.c:307:
+	if (header->if_type >= ESP_MAX_IF) {
+		return -EINVAL;
+	}

WARNING: braces {} are not necessary for single statement blocks
#5253: drivers/net/wireless/espressif/esp32-ng/esp_spi.c:314:
+	if (offset != sizeof(struct esp_payload_header)) {
+		return -EINVAL;
+	}

WARNING: braces {} are not necessary for single statement blocks
#5258: drivers/net/wireless/espressif/esp32-ng/esp_spi.c:319:
+	if (!len) {
+		return -EINVAL;
+	}

WARNING: braces {} are not necessary for single statement blocks
#5264: drivers/net/wireless/espressif/esp32-ng/esp_spi.c:325:
+	if (len > SPI_BUF_SIZE) {
+		return -EINVAL;
+	}

CHECK: Please don't use multiple blank lines
#5271: drivers/net/wireless/espressif/esp32-ng/esp_spi.c:332:
+
+

WARNING: Use of volatile is usually wrong: see Documentation/process/volatile-considered-harmful.rst
#5298: drivers/net/wireless/espressif/esp32-ng/esp_spi.c:359:
+	volatile int trans_ready, rx_pending;

WARNING: line length of 103 exceeds 100 columns
#5318: drivers/net/wireless/espressif/esp32-ng/esp_spi.c:379:
+				if (cb && cb->priv && atomic_read(&tx_pending) < TX_RESUME_THRESHOLD) {

WARNING: Block comments use a trailing */ on a separate line
#5338: drivers/net/wireless/espressif/esp32-ng/esp_spi.c:399:
+			 * */

WARNING: line length of 118 exceeds 100 columns
#5344: drivers/net/wireless/espressif/esp32-ng/esp_spi.c:405:
+				/*print_hex_dump(KERN_ERR, "tx: ", DUMP_PREFIX_ADDRESS, 16, 1, trans.tx_buf, 32, 1);*/

WARNING: LINUX_VERSION_CODE should be avoided, code should be for the version to which it is merged
#5360: drivers/net/wireless/espressif/esp32-ng/esp_spi.c:421:
+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3, 15, 0))

WARNING: Comparisons should place the constant on the right side of the test
#5360: drivers/net/wireless/espressif/esp32-ng/esp_spi.c:421:
+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3, 15, 0))

WARNING: braces {} are not necessary for single statement blocks
#5361: drivers/net/wireless/espressif/esp32-ng/esp_spi.c:422:
+			if (hardware_type == ESP_FIRMWARE_CHIP_ESP32) {
+				trans.cs_change = 1;
+			}

CHECK: Blank lines aren't necessary after an open brace '{'
#5372: drivers/net/wireless/espressif/esp32-ng/esp_spi.c:433:
+			} else {
+

WARNING: braces {} are not necessary for single statement blocks
#5374: drivers/net/wireless/espressif/esp32-ng/esp_spi.c:435:
+				if (process_rx_buf(rx_skb)) {
+					dev_kfree_skb(rx_skb);
+				}

WARNING: LINUX_VERSION_CODE should be avoided, code should be for the version to which it is merged
#5387: drivers/net/wireless/espressif/esp32-ng/esp_spi.c:448:
+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(5, 16, 0))

WARNING: Comparisons should place the constant on the right side of the test
#5387: drivers/net/wireless/espressif/esp32-ng/esp_spi.c:448:
+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(5, 16, 0))

WARNING: braces {} are not necessary for single statement blocks
#5396: drivers/net/wireless/espressif/esp32-ng/esp_spi.c:457:
+	if (!ctlr) {
+		return 0;
+	}

WARNING: braces {} are not necessary for single statement blocks
#5423: drivers/net/wireless/espressif/esp32-ng/esp_spi.c:484:
+	if (dev) {
+		ctlr = container_of(dev, struct spi_controller, dev);
+	}

WARNING: Prefer strscpy over strlcpy - see: https://github.com/KSPP/linux/issues/89
#5441: drivers/net/wireless/espressif/esp32-ng/esp_spi.c:502:
+	strlcpy(esp_board.modalias, "esp_spi", sizeof(esp_board.modalias));

CHECK: Alignment should match open parenthesis
#5468: drivers/net/wireless/espressif/esp32-ng/esp_spi.c:529:
+	esp_info("ESP32 peripheral is registered to SPI bus [%d],chip select [%d], SPI Clock [%d]\n",
+			esp_board.bus_num,

CHECK: Alignment should match open parenthesis
#5487: drivers/net/wireless/espressif/esp32-ng/esp_spi.c:548:
+	status = request_irq(SPI_IRQ, spi_interrupt_handler,
+			IRQF_SHARED | IRQF_TRIGGER_RISING,

CHECK: Alignment should match open parenthesis
#5513: drivers/net/wireless/espressif/esp32-ng/esp_spi.c:574:
+	status = request_irq(SPI_DATA_READY_IRQ, spi_data_ready_interrupt_handler,
+			IRQF_SHARED | IRQF_TRIGGER_RISING,

CHECK: Prefer kernel type 'u8' over 'uint8_t'
#5532: drivers/net/wireless/espressif/esp32-ng/esp_spi.c:593:
+	uint8_t prio_q_idx = 0;

CHECK: Prefer kernel type 'u8' over 'uint8_t'
#5571: drivers/net/wireless/espressif/esp32-ng/esp_spi.c:632:
+	uint8_t prio_q_idx = 0;

CHECK: Unnecessary parentheses around 'spi_clk_mhz != spi_context.spi_clk_mhz'
#5610: drivers/net/wireless/espressif/esp32-ng/esp_spi.c:671:
+	if ((spi_clk_mhz) && (spi_clk_mhz != spi_context.spi_clk_mhz)) {

WARNING: Missing or malformed SPDX-License-Identifier tag in line 1
#5643: drivers/net/wireless/espressif/esp32-ng/esp_spi.h:1:
+/*

WARNING: Misplaced SPDX-License-Identifier tag - use line 1 instead
#5646: drivers/net/wireless/espressif/esp32-ng/esp_spi.h:4:
+ * SPDX-License-Identifier: GPL-2.0-only

CHECK: Prefer kernel type 'u8' over 'uint8_t'
#5669: drivers/net/wireless/espressif/esp32-ng/esp_spi.h:27:
+	uint8_t                     spi_clk_mhz;

CHECK: Prefer kernel type 'u8' over 'uint8_t'
#5670: drivers/net/wireless/espressif/esp32-ng/esp_spi.h:28:
+	uint8_t                     spi_gpio_enabled;

CHECK: Prefer kernel type 'u8' over 'uint8_t'
#5671: drivers/net/wireless/espressif/esp32-ng/esp_spi.h:29:
+	uint8_t                     reserved[2];

CHECK: Please don't use multiple blank lines
#5679: drivers/net/wireless/espressif/esp32-ng/esp_spi.h:37:
+
+

CHECK: spaces preferred around that '*' (ctx:VxV)
#5718: drivers/net/wireless/espressif/esp32-ng/esp_stats.c:32:
+	actual_bandwidth = (test_raw_tp_len*8)/1024;
 	                                   ^

CHECK: spaces preferred around that '/' (ctx:VxV)
#5718: drivers/net/wireless/espressif/esp32-ng/esp_stats.c:32:
+	actual_bandwidth = (test_raw_tp_len*8)/1024;
 	                                      ^

CHECK: Alignment should match open parenthesis
#5720: drivers/net/wireless/espressif/esp32-ng/esp_stats.c:34:
+	esp_info("%u-%u sec       %lu kbits/sec\n\r",
+			raw_tp_timer_count,

CHECK: Blank lines aren't necessary after an open brace '{'
#5747: drivers/net/wireless/espressif/esp32-ng/esp_stats.c:61:
+	while (!kthread_should_stop()) {
+

CHECK: Blank lines aren't necessary after an open brace '{'
#5749: drivers/net/wireless/espressif/esp32-ng/esp_stats.c:63:
+		if (esp_is_tx_queue_paused(priv)) {
+

WARNING: Possible unnecessary 'out of memory' message
#5752: drivers/net/wireless/espressif/esp32-ng/esp_stats.c:66:
+			if (!tx_skb) {
+				esp_info("%u esp_alloc_skb failed\n", __LINE__);

WARNING: msleep < 20ms can sleep for up to 20ms; see Documentation/timers/timers-howto.rst
#5753: drivers/net/wireless/espressif/esp32-ng/esp_stats.c:67:
+				msleep(10);

CHECK: No space is necessary after a cast
#5758: drivers/net/wireless/espressif/esp32-ng/esp_stats.c:72:
+			cb = (struct esp_skb_cb *) tx_skb->cb;

CHECK: No space is necessary after a cast
#5761: drivers/net/wireless/espressif/esp32-ng/esp_stats.c:75:
+			payload_header = (struct esp_payload_header *) tx_skb->data;

CHECK: Alignment should match open parenthesis
#5772: drivers/net/wireless/espressif/esp32-ng/esp_stats.c:86:
+					cpu_to_le16(compute_checksum(tx_skb->data,
+								(TEST_RAW_TP__BUF_SIZE + pad_len)));

CHECK: Blank lines aren't necessary after an open brace '{'
#5792: drivers/net/wireless/espressif/esp32-ng/esp_stats.c:106:
+	if (test_raw_tp) {
+

CHECK: Blank lines aren't necessary after an open brace '{'
#5798: drivers/net/wireless/espressif/esp32-ng/esp_stats.c:112:
+		if (test_raw_tp__host_to_esp) {
+

CHECK: Blank lines aren't necessary before a close brace '}'
#5803: drivers/net/wireless/espressif/esp32-ng/esp_stats.c:117:
+
+		}

CHECK: Please don't use multiple blank lines
#5811: drivers/net/wireless/espressif/esp32-ng/esp_stats.c:125:
+
+

WARNING: braces {} are not necessary for single statement blocks
#5837: drivers/net/wireless/espressif/esp32-ng/esp_stats.c:151:
+		if (!ret) {
+			log_raw_tp_stats_timer_running = 0;
+		}

WARNING: msleep < 20ms can sleep for up to 20ms; see Documentation/timers/timers-howto.rst
#5850: drivers/net/wireless/espressif/esp32-ng/esp_stats.c:164:
+			msleep(10);

WARNING: Improper SPDX comment style for 'drivers/net/wireless/espressif/esp32-ng/esp_stats.h', please use '/*' instead
#5893: drivers/net/wireless/espressif/esp32-ng/esp_stats.h:1:
+// SPDX-License-Identifier: GPL-2.0-only

WARNING: Missing or malformed SPDX-License-Identifier tag in line 1
#5893: drivers/net/wireless/espressif/esp32-ng/esp_stats.h:1:
+// SPDX-License-Identifier: GPL-2.0-only

CHECK: Please don't use multiple blank lines
#5941: drivers/net/wireless/espressif/esp32-ng/esp_wpa_utils.c:11:
+
+

WARNING: Consider removing the code enclosed by this #if 0 and its #endif
#5982: drivers/net/wireless/espressif/esp32-ng/esp_wpa_utils.c:52:
+#if 0

WARNING: Improper SPDX comment style for 'drivers/net/wireless/espressif/esp32-ng/esp_wpa_utils.h', please use '/*' instead
#6000: drivers/net/wireless/espressif/esp32-ng/esp_wpa_utils.h:1:
+// SPDX-License-Identifier: GPL-2.0-only

WARNING: Missing or malformed SPDX-License-Identifier tag in line 1
#6000: drivers/net/wireless/espressif/esp32-ng/esp_wpa_utils.h:1:
+// SPDX-License-Identifier: GPL-2.0-only

WARNING: please, no spaces at the start of a line
#6025: drivers/net/wireless/espressif/esp32-ng/esp_wpa_utils.h:26:
+    WIFI_WPA_ALG_NONE   = 0,$

WARNING: please, no spaces at the start of a line
#6026: drivers/net/wireless/espressif/esp32-ng/esp_wpa_utils.h:27:
+    WIFI_WPA_ALG_WEP40  = 1,$

WARNING: please, no spaces at the start of a line
#6027: drivers/net/wireless/espressif/esp32-ng/esp_wpa_utils.h:28:
+    WIFI_WPA_ALG_TKIP   = 2,$

WARNING: please, no spaces at the start of a line
#6028: drivers/net/wireless/espressif/esp32-ng/esp_wpa_utils.h:29:
+    WIFI_WPA_ALG_CCMP   = 3,$

WARNING: please, no spaces at the start of a line
#6029: drivers/net/wireless/espressif/esp32-ng/esp_wpa_utils.h:30:
+    WIFI_WAPI_ALG_SMS4  = 4,$

WARNING: please, no spaces at the start of a line
#6030: drivers/net/wireless/espressif/esp32-ng/esp_wpa_utils.h:31:
+    WIFI_WPA_ALG_WEP104 = 5,$

WARNING: please, no spaces at the start of a line
#6031: drivers/net/wireless/espressif/esp32-ng/esp_wpa_utils.h:32:
+    WIFI_WPA_ALG_WEP    = 6,$

WARNING: please, no spaces at the start of a line
#6032: drivers/net/wireless/espressif/esp32-ng/esp_wpa_utils.h:33:
+    WIFI_WPA_ALG_IGTK   = 7,$

WARNING: please, no spaces at the start of a line
#6033: drivers/net/wireless/espressif/esp32-ng/esp_wpa_utils.h:34:
+    WIFI_WPA_ALG_PMK    = 8,$

WARNING: please, no spaces at the start of a line
#6034: drivers/net/wireless/espressif/esp32-ng/esp_wpa_utils.h:35:
+    WIFI_WPA_ALG_GCMP   = 9,$

CHECK: Please don't use multiple blank lines
#6039: drivers/net/wireless/espressif/esp32-ng/esp_wpa_utils.h:40:
+
+

WARNING: externs should be avoided in .c files
#6073: drivers/net/wireless/espressif/esp32-ng/main.c:27:
+extern u8 ap_bssid[MAC_ADDR_LEN];

WARNING: Use of volatile is usually wrong: see Documentation/process/volatile-considered-harmful.rst
#6074: drivers/net/wireless/espressif/esp32-ng/main.c:28:
+extern volatile u8 host_sleep;

WARNING: externs should be avoided in .c files
#6074: drivers/net/wireless/espressif/esp32-ng/main.c:28:
+extern volatile u8 host_sleep;

WARNING: Symbolic permissions 'S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH' are not preferred. Consider using octal permissions '0644'.
#6076: drivers/net/wireless/espressif/esp32-ng/main.c:30:
+module_param(resetpin, int, S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH);

CHECK: Please don't use multiple blank lines
#6081: drivers/net/wireless/espressif/esp32-ng/main.c:35:
+
+

CHECK: No space is necessary after a cast
#6112: drivers/net/wireless/espressif/esp32-ng/main.c:66:
+	cb = (struct esp_skb_cb *) skb->cb;

CHECK: No space is necessary after a cast
#6121: drivers/net/wireless/espressif/esp32-ng/main.c:75:
+	if (netif_queue_stopped((const struct net_device *) priv->ndev)) {

WARNING: braces {} are not necessary for single statement blocks
#6126: drivers/net/wireless/espressif/esp32-ng/main.c:80:
+	if (host_sleep) {
+		return NETDEV_TX_BUSY;
+	}

CHECK: No space is necessary after a cast
#6145: drivers/net/wireless/espressif/esp32-ng/main.c:99:
+	if (realloc_skb || !IS_ALIGNED((unsigned long) skb->data, SKB_DATA_ADDR_ALIGNMENT)) {

WARNING: Possible unnecessary 'out of memory' message
#6157: drivers/net/wireless/espressif/esp32-ng/main.c:111:
+		if (!new_skb) {
+			esp_err("Failed to allocate SKB");

CHECK: No space is necessary after a cast
#6179: drivers/net/wireless/espressif/esp32-ng/main.c:133:
+	payload_header = (struct esp_payload_header *) skb->data;

WARNING: line length of 101 exceeds 100 columns
#6189: drivers/net/wireless/espressif/esp32-ng/main.c:143:
+		payload_header->checksum = cpu_to_le16(compute_checksum(skb->data, (len + pad_len)));

CHECK: Alignment should match open parenthesis
#6233: drivers/net/wireless/espressif/esp32-ng/main.c:187:
+	if ((cap & ESP_BT_UART_SUPPORT) ||
+		    (cap & ESP_BT_SDIO_SUPPORT) ||

CHECK: Alignment should match open parenthesis
#6260: drivers/net/wireless/espressif/esp32-ng/main.c:214:
+	if ((adapter->capabilities & ESP_BT_SPI_SUPPORT) ||
+		(adapter->capabilities & ESP_BT_SDIO_SUPPORT)) {

CHECK: Alignment should match open parenthesis
#6270: drivers/net/wireless/espressif/esp32-ng/main.c:224:
+	esp_info("esp32: %u.%u.%u\n",
+			ver->major1, ver->major2, ver->minor);

ERROR: that open brace { should be on the previous line
#6280: drivers/net/wireless/espressif/esp32-ng/main.c:234:
+	switch (reason)
+	{

ERROR: trailing statements should be on next line
#6282: drivers/net/wireless/espressif/esp32-ng/main.c:236:
+		case 1: esp_info("POWERON_RESET\n"); break;          /**<1, Vbat power on reset*/

WARNING: line length of 105 exceeds 100 columns
#6283: drivers/net/wireless/espressif/esp32-ng/main.c:237:
+		case 3: esp_info("SW_RESET\n"); break;               /**<3, Software reset digital core*/

ERROR: trailing statements should be on next line
#6283: drivers/net/wireless/espressif/esp32-ng/main.c:237:
+		case 3: esp_info("SW_RESET\n"); break;               /**<3, Software reset digital core*/

WARNING: line length of 113 exceeds 100 columns
#6284: drivers/net/wireless/espressif/esp32-ng/main.c:238:
+		case 4: esp_info("OWDT_RESET\n"); break;             /**<4, Legacy watch dog reset digital core*/

ERROR: trailing statements should be on next line
#6284: drivers/net/wireless/espressif/esp32-ng/main.c:238:
+		case 4: esp_info("OWDT_RESET\n"); break;             /**<4, Legacy watch dog reset digital core*/

WARNING: line length of 107 exceeds 100 columns
#6285: drivers/net/wireless/espressif/esp32-ng/main.c:239:
+		case 5: esp_info("DEEPSLEEP_RESET\n"); break;        /**<5, Deep Sleep reset digital core*/

ERROR: trailing statements should be on next line
#6285: drivers/net/wireless/espressif/esp32-ng/main.c:239:
+		case 5: esp_info("DEEPSLEEP_RESET\n"); break;        /**<5, Deep Sleep reset digital core*/

WARNING: line length of 117 exceeds 100 columns
#6286: drivers/net/wireless/espressif/esp32-ng/main.c:240:
+		case 6: esp_info("SDIO_RESET\n"); break;             /**<6, Reset by SLC module, reset digital core*/

ERROR: trailing statements should be on next line
#6286: drivers/net/wireless/espressif/esp32-ng/main.c:240:
+		case 6: esp_info("SDIO_RESET\n"); break;             /**<6, Reset by SLC module, reset digital core*/

WARNING: line length of 119 exceeds 100 columns
#6287: drivers/net/wireless/espressif/esp32-ng/main.c:241:
+		case 7: esp_info("TG0WDT_SYS_RESET\n"); break;       /**<7, Timer Group0 Watch dog reset digital core*/

ERROR: trailing statements should be on next line
#6287: drivers/net/wireless/espressif/esp32-ng/main.c:241:
+		case 7: esp_info("TG0WDT_SYS_RESET\n"); break;       /**<7, Timer Group0 Watch dog reset digital core*/

WARNING: line length of 119 exceeds 100 columns
#6288: drivers/net/wireless/espressif/esp32-ng/main.c:242:
+		case 8: esp_info("TG1WDT_SYS_RESET\n"); break;       /**<8, Timer Group1 Watch dog reset digital core*/

ERROR: trailing statements should be on next line
#6288: drivers/net/wireless/espressif/esp32-ng/main.c:242:
+		case 8: esp_info("TG1WDT_SYS_RESET\n"); break;       /**<8, Timer Group1 Watch dog reset digital core*/

WARNING: line length of 110 exceeds 100 columns
#6289: drivers/net/wireless/espressif/esp32-ng/main.c:243:
+		case 9: esp_info("RTCWDT_SYS_RESET\n"); break;       /**<9, RTC Watch dog Reset digital core*/

ERROR: trailing statements should be on next line
#6289: drivers/net/wireless/espressif/esp32-ng/main.c:243:
+		case 9: esp_info("RTCWDT_SYS_RESET\n"); break;       /**<9, RTC Watch dog Reset digital core*/

WARNING: line length of 109 exceeds 100 columns
#6290: drivers/net/wireless/espressif/esp32-ng/main.c:244:
+		case 10: esp_info("INTRUSION_RESET\n"); break;       /**<10, Instrusion tested to reset CPU*/

ERROR: trailing statements should be on next line
#6290: drivers/net/wireless/espressif/esp32-ng/main.c:244:
+		case 10: esp_info("INTRUSION_RESET\n"); break;       /**<10, Instrusion tested to reset CPU*/

ERROR: trailing statements should be on next line
#6291: drivers/net/wireless/espressif/esp32-ng/main.c:245:
+		case 11: esp_info("TGWDT_CPU_RESET\n"); break;       /**<11, Time Group reset CPU*/

ERROR: trailing statements should be on next line
#6292: drivers/net/wireless/espressif/esp32-ng/main.c:246:
+		case 12: esp_info("SW_CPU_RESET\n"); break;          /**<12, Software reset CPU*/

WARNING: line length of 102 exceeds 100 columns
#6293: drivers/net/wireless/espressif/esp32-ng/main.c:247:
+		case 13: esp_info("RTCWDT_CPU_RESET\n"); break;      /**<13, RTC Watch dog Reset CPU*/

ERROR: trailing statements should be on next line
#6293: drivers/net/wireless/espressif/esp32-ng/main.c:247:
+		case 13: esp_info("RTCWDT_CPU_RESET\n"); break;      /**<13, RTC Watch dog Reset CPU*/

WARNING: line length of 110 exceeds 100 columns
#6294: drivers/net/wireless/espressif/esp32-ng/main.c:248:
+		case 14: esp_info("EXT_CPU_RESET\n"); break;         /**<14, for APP CPU, reseted by PRO CPU*/

ERROR: trailing statements should be on next line
#6294: drivers/net/wireless/espressif/esp32-ng/main.c:248:
+		case 14: esp_info("EXT_CPU_RESET\n"); break;         /**<14, for APP CPU, reseted by PRO CPU*/

WARNING: line length of 119 exceeds 100 columns
#6295: drivers/net/wireless/espressif/esp32-ng/main.c:249:
+		case 15: esp_info("RTCWDT_BROWN_OUT_RESET\n"); break;/**<15, Reset when the vdd voltage is not stable*/

ERROR: trailing statements should be on next line
#6295: drivers/net/wireless/espressif/esp32-ng/main.c:249:
+		case 15: esp_info("RTCWDT_BROWN_OUT_RESET\n"); break;/**<15, Reset when the vdd voltage is not stable*/

WARNING: line length of 126 exceeds 100 columns
#6296: drivers/net/wireless/espressif/esp32-ng/main.c:250:
+		case 16: esp_info("RTCWDT_RTC_RESET\n"); break;      /**<16, RTC Watch dog reset digital core and rtc module*/

ERROR: trailing statements should be on next line
#6296: drivers/net/wireless/espressif/esp32-ng/main.c:250:
+		case 16: esp_info("RTCWDT_RTC_RESET\n"); break;      /**<16, RTC Watch dog reset digital core and rtc module*/

ERROR: trailing statements should be on next line
#6297: drivers/net/wireless/espressif/esp32-ng/main.c:251:
+		default: esp_info("Unknown[%u]\n", reason); break;

CHECK: Concatenated strings should use spaces between elements
#6345: drivers/net/wireless/espressif/esp32-ng/main.c:299:
+	esp_info("%u "MACSTR"\n", __LINE__, MAC2STR(sa->sa_data));

WARNING: Consider removing the code enclosed by this #if 0 and its #endif
#6360: drivers/net/wireless/espressif/esp32-ng/main.c:314:
+#if 0

WARNING: Consider removing the code enclosed by this #if 0 and its #endif
#6379: drivers/net/wireless/espressif/esp32-ng/main.c:333:
+#if 0

CHECK: Blank lines aren't necessary before a close brace '}'
#6387: drivers/net/wireless/espressif/esp32-ng/main.c:341:
+
+}

CHECK: Unnecessary parentheses around 'skb->len > ETH_FRAME_LEN'
#6410: drivers/net/wireless/espressif/esp32-ng/main.c:364:
+	if (!skb->len || (skb->len > ETH_FRAME_LEN)) {

CHECK: No space is necessary after a cast
#6417: drivers/net/wireless/espressif/esp32-ng/main.c:371:
+	cb = (struct esp_skb_cb *) skb->cb;

CHECK: Please don't use multiple blank lines
#6433: drivers/net/wireless/espressif/esp32-ng/main.c:387:
+
+

CHECK: Prefer kernel type 'u8' over 'uint8_t'
#6480: drivers/net/wireless/espressif/esp32-ng/main.c:434:
+	uint8_t iface_idx = 0;

CHECK: Blank lines aren't necessary after an open brace '{'
#6485: drivers/net/wireless/espressif/esp32-ng/main.c:439:
+	for (iface_idx = 0; iface_idx < ESP_MAX_INTERFACE; iface_idx++) {
+

CHECK: Blank lines aren't necessary after an open brace '{'
#6498: drivers/net/wireless/espressif/esp32-ng/main.c:452:
+		if (ndev) {
+

CHECK: Unnecessary parentheses around adapter->priv[0]->nb
#6505: drivers/net/wireless/espressif/esp32-ng/main.c:459:
+				unregister_inetaddr_notifier(&(adapter->priv[0]->nb));

CHECK: Blank lines aren't necessary after an open brace '{'
#6515: drivers/net/wireless/espressif/esp32-ng/main.c:469:
+	if (adapter->wiphy) {
+

CHECK: Prefer kernel type 'u8' over 'uint8_t'
#6524: drivers/net/wireless/espressif/esp32-ng/main.c:478:
+	uint8_t iface_idx = 0;

WARNING: braces {} are not necessary for single statement blocks
#6526: drivers/net/wireless/espressif/esp32-ng/main.c:480:
+	if (!adapter) {
+		return 0;
+	}

CHECK: Lines should not end with a '('
#6544: drivers/net/wireless/espressif/esp32-ng/main.c:498:
+struct esp_wifi_device *get_priv_from_payload_header(

CHECK: Alignment should match open parenthesis
#6560: drivers/net/wireless/espressif/esp32-ng/main.c:514:
+		if (priv->if_type == header->if_type &&
+				priv->if_num == header->if_num) {

CHECK: Alignment should match open parenthesis
#6568: drivers/net/wireless/espressif/esp32-ng/main.c:522:
+static void process_esp_bootup_event(struct esp_adapter *adapter,
+		struct esp_internal_bootup_event *evt)

CHECK: Alignment should match open parenthesis
#6585: drivers/net/wireless/espressif/esp32-ng/main.c:539:
+static int process_internal_event(struct esp_adapter *adapter,
+		struct sk_buff *skb)

CHECK: No space is necessary after a cast
#6594: drivers/net/wireless/espressif/esp32-ng/main.c:548:
+	header = (struct event_header *) (skb->data);

CHECK: Blank lines aren't necessary after an open brace '{'
#6597: drivers/net/wireless/espressif/esp32-ng/main.c:551:
+	switch (header->event_code) {
+

CHECK: Alignment should match open parenthesis
#6600: drivers/net/wireless/espressif/esp32-ng/main.c:554:
+		process_esp_bootup_event(adapter,
+			(struct esp_internal_bootup_event *)(skb->data));

CHECK: Alignment should match open parenthesis
#6605: drivers/net/wireless/espressif/esp32-ng/main.c:559:
+		esp_info("%u unhandled internal event[%u]\n",
+				__LINE__, header->event_code);

CHECK: No space is necessary after a cast
#6627: drivers/net/wireless/espressif/esp32-ng/main.c:581:
+	payload_header = (struct esp_payload_header *) skb->data;

WARNING: braces {} are not necessary for single statement blocks
#6632: drivers/net/wireless/espressif/esp32-ng/main.c:586:
+	if (payload_header->reserved2 == 0xFF) {
+		print_hex_dump(KERN_INFO, "Wake up packet: ", DUMP_PREFIX_ADDRESS, 16, 1, skb->data, len+offset, 1);
+	}

WARNING: line length of 116 exceeds 100 columns
#6633: drivers/net/wireless/espressif/esp32-ng/main.c:587:
+		print_hex_dump(KERN_INFO, "Wake up packet: ", DUMP_PREFIX_ADDRESS, 16, 1, skb->data, len+offset, 1);

CHECK: spaces preferred around that '+' (ctx:VxV)
#6633: drivers/net/wireless/espressif/esp32-ng/main.c:587:
+		print_hex_dump(KERN_INFO, "Wake up packet: ", DUMP_PREFIX_ADDRESS, 16, 1, skb->data, len+offset, 1);
 		                                                                                        ^

CHECK: Blank lines aren't necessary after an open brace '{'
#6652: drivers/net/wireless/espressif/esp32-ng/main.c:606:
+	if (payload_header->if_type == ESP_STA_IF || payload_header->if_type == ESP_AP_IF) {
+

WARNING: Possible unnecessary 'out of memory' message
#6668: drivers/net/wireless/espressif/esp32-ng/main.c:622:
+			if (!eap_skb) {
+				esp_info("%u memory alloc failed\n", __LINE__);

CHECK: No space is necessary after a cast
#6673: drivers/net/wireless/espressif/esp32-ng/main.c:627:
+			if (!IS_ALIGNED((unsigned long) eap_skb->data, SKB_DATA_ADDR_ALIGNMENT)) {

WARNING: braces {} are not necessary for single statement blocks
#6673: drivers/net/wireless/espressif/esp32-ng/main.c:627:
+			if (!IS_ALIGNED((unsigned long) eap_skb->data, SKB_DATA_ADDR_ALIGNMENT)) {
+				esp_info("%u eap skb unaligned\n", __LINE__);
+			}

CHECK: No space is necessary after a cast
#6677: drivers/net/wireless/espressif/esp32-ng/main.c:631:
+			eth = (struct ethhdr *) skb_put(eap_skb, ETH_HLEN);

CHECK: Blank lines aren't necessary after an open brace '{'
#6688: drivers/net/wireless/espressif/esp32-ng/main.c:642:
+		} else if (payload_header->packet_type == PACKET_TYPE_DATA) {
+

CHECK: Blank lines aren't necessary after an open brace '{'
#6706: drivers/net/wireless/espressif/esp32-ng/main.c:660:
+		if (hdev) {
+

WARNING: LINUX_VERSION_CODE should be avoided, code should be for the version to which it is merged
#6711: drivers/net/wireless/espressif/esp32-ng/main.c:665:
+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3, 13, 0))

WARNING: Comparisons should place the constant on the right side of the test
#6711: drivers/net/wireless/espressif/esp32-ng/main.c:665:
+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3, 13, 0))

CHECK: Blank lines aren't necessary after an open brace '{'
#6722: drivers/net/wireless/espressif/esp32-ng/main.c:676:
+	} else if (payload_header->if_type == ESP_INTERNAL_IF) {
+

WARNING: suspect code indent for conditional statements (8, 24)
#6731: drivers/net/wireless/espressif/esp32-ng/main.c:685:
+	} else if (payload_header->if_type == ESP_TEST_IF) {
[...]
+			update_test_raw_tp_rx_stats(len);

CHECK: Alignment should match open parenthesis
#6747: drivers/net/wireless/espressif/esp32-ng/main.c:701:
+	if ((priv->ndev &&
+		    !netif_queue_stopped((const struct net_device *)priv->ndev)))

WARNING: please, no spaces at the start of a line
#6749: drivers/net/wireless/espressif/esp32-ng/main.c:703:
+    return 0;$

WARNING: braces {} are not necessary for single statement blocks
#6757: drivers/net/wireless/espressif/esp32-ng/main.c:711:
+	if (!netif_queue_stopped((const struct net_device *)priv->ndev)) {
+		netif_stop_queue(priv->ndev);
+	}

WARNING: braces {} are not necessary for single statement blocks
#6767: drivers/net/wireless/espressif/esp32-ng/main.c:721:
+	if (netif_queue_stopped((const struct net_device *)priv->ndev)) {
+		netif_wake_queue(priv->ndev);
+	}

CHECK: Please don't use multiple blank lines
#6791: drivers/net/wireless/espressif/esp32-ng/main.c:745:
+
+

CHECK: usleep_range is preferred over udelay; see Documentation/timers/timers-howto.rst
#6907: drivers/net/wireless/espressif/esp32-ng/main.c:861:
+			udelay(200);

CHECK: Please don't use multiple blank lines
#6917: drivers/net/wireless/espressif/esp32-ng/main.c:871:
+
+

WARNING: braces {} are not necessary for single statement blocks
#6935: drivers/net/wireless/espressif/esp32-ng/main.c:889:
+	if (ret != 0) {
+		deinit_adapter();
+	}

CHECK: Prefer kernel type 'u8' over 'uint8_t'
#6944: drivers/net/wireless/espressif/esp32-ng/main.c:898:
+	uint8_t iface_idx = 0;

WARNING: braces {} are not necessary for single statement blocks
#6948: drivers/net/wireless/espressif/esp32-ng/main.c:902:
+	for (iface_idx = 0; iface_idx < ESP_MAX_INTERFACE; iface_idx++) {
+		cmd_deinit_interface(adapter.priv[iface_idx]);
+	}

WARNING: braces {} are not necessary for single statement blocks
#6956: drivers/net/wireless/espressif/esp32-ng/main.c:910:
+	if (resetpin != HOST_GPIO_PIN_INVALID) {
+		gpio_free(resetpin);
+	}

WARNING: Improper SPDX comment style for 'drivers/net/wireless/espressif/esp32-ng/utils.h', please use '/*' instead
#6974: drivers/net/wireless/espressif/esp32-ng/utils.h:1:
+// SPDX-License-Identifier: GPL-2.0-only

WARNING: Missing or malformed SPDX-License-Identifier tag in line 1
#6974: drivers/net/wireless/espressif/esp32-ng/utils.h:1:
+// SPDX-License-Identifier: GPL-2.0-only

ERROR: Macros with complex values should be enclosed in parentheses
#6983: drivers/net/wireless/espressif/esp32-ng/utils.h:10:
+#define MAC2STR(a) (a)[0], (a)[1], (a)[2], (a)[3], (a)[4], (a)[5]

CHECK: Macro argument reuse 'a' - possible side-effects?
#6983: drivers/net/wireless/espressif/esp32-ng/utils.h:10:
+#define MAC2STR(a) (a)[0], (a)[1], (a)[2], (a)[3], (a)[4], (a)[5]

ERROR: space required before the open parenthesis '('
#6992: drivers/net/wireless/espressif/esp32-ng/utils.h:19:
+#define esp_info(...) do {} while(0)

ERROR: space required before the open parenthesis '('
#6998: drivers/net/wireless/espressif/esp32-ng/utils.h:25:
+#define esp_dbg(...) do {} while(0)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
