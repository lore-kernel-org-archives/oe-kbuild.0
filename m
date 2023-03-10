Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56BDDAAD
	for <oe-kbuild@lists.linux.dev>; Fri, 10 Mar 2023 20:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678479569; x=1710015569;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Nywi+2HBpVOtW0EP2uZI9Fo6MWtC5oN8fZt1yALozjo=;
  b=VTvds8cHlGv0eg5tjYockSB8QLpOfOBjhjTKR4Z03cjT6MTlDTrHlxQc
   YnPMEysjwJB5EzPzQNoI1SHu6istmcvXbYFxzMJLhdj2UeFWMULRNtJPz
   FPvOSDc3dKU2irZ65UA6AwkAh4MEoI45FvDuAkp+dZGlbO/4BjewSUxlr
   hf7QYOtOm89R+D9KAmrmoLaMxg1gCcMSR5ZIPOfcnNpvFXyRP+TYgLGMg
   G7yAk1gcSCJutQrN+CEstx3eN0ODb0Ij+D6RNi14IHvRUwf1R31KlsL7v
   9jKKZtHjvAlY/6ocrmuyINoZ3P+syRw/FBOynwhLN6YfpUbzWREWy/EYs
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="423087552"
X-IronPort-AV: E=Sophos;i="5.98,250,1673942400"; 
   d="scan'208";a="423087552"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2023 12:19:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="923804247"
X-IronPort-AV: E=Sophos;i="5.98,250,1673942400"; 
   d="scan'208";a="923804247"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 10 Mar 2023 12:19:28 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pajD5-00044x-1u;
	Fri, 10 Mar 2023 20:19:27 +0000
Date: Sat, 11 Mar 2023 04:19:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [chrome-os:chromeos-6.1 50/238]
 sound/hda/ext/hdac_ext_controller.c:140:28: warning: Shifting signed 32-bit
 value by 31 bits is implementation-defined behaviour. See condition at line
 160. [shiftTooManyBitsSigned]
Message-ID: <202303110432.um5YzjwT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: sound/hda/ext/hdac_ext_controller.c:140:28: warning: Shifting signed 32-bit value by 31 bits is implementation-defined behaviour. See condition at line 160. [shiftTooManyBitsSigned]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com
TO: Guenter Roeck <groeck@google.com>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   830ed3dc18af0cc6005b58960c6cc04516bd3c75
commit: c55a05f80b7c92ce68b909375ec1c39d0717553d [50/238] UPSTREAM: ALSA: hda: hdac_ext_controller: remove useless loop
:::::: branch date: 2 hours ago
:::::: commit date: 2 days ago
compiler: alpha-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout c55a05f80b7c92ce68b909375ec1c39d0717553d
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303110432.um5YzjwT-lkp@intel.com/


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> sound/hda/ext/hdac_ext_controller.c:140:28: warning: Shifting signed 32-bit value by 31 bits is implementation-defined behaviour. See condition at line 160. [shiftTooManyBitsSigned]
     if (hlink->lsdiid & (0x1 << addr))
                              ^
   sound/hda/ext/hdac_ext_controller.c:160:23: note: Assuming that condition 'addr>31' is not redundant
    if (addr < 0 || addr > 31)
                         ^
   sound/hda/ext/hdac_ext_controller.c:163:49: note: Calling function 'snd_hdac_ext_bus_get_hlink_by_addr', 2nd argument 'addr' value is 31
    return snd_hdac_ext_bus_get_hlink_by_addr(bus, addr);
                                                   ^
   sound/hda/ext/hdac_ext_controller.c:140:28: note: Shift
     if (hlink->lsdiid & (0x1 << addr))
                              ^

vim +140 sound/hda/ext/hdac_ext_controller.c

bab4445f9a083f Vinod Koul           2015-06-17  127  
fefee954884127 Cezary Rojewski      2022-02-14  128  /**
877908ab3f4972 Pierre-Louis Bossart 2022-10-19  129   * snd_hdac_ext_bus_get_hlink_by_addr - get hlink at specified address
877908ab3f4972 Pierre-Louis Bossart 2022-10-19  130   * @bus: hlink's parent bus device
fefee954884127 Cezary Rojewski      2022-02-14  131   * @addr: codec device address
fefee954884127 Cezary Rojewski      2022-02-14  132   *
877908ab3f4972 Pierre-Louis Bossart 2022-10-19  133   * Returns hlink object or NULL if matching hlink is not found.
fefee954884127 Cezary Rojewski      2022-02-14  134   */
877908ab3f4972 Pierre-Louis Bossart 2022-10-19  135  struct hdac_ext_link *snd_hdac_ext_bus_get_hlink_by_addr(struct hdac_bus *bus, int addr)
fefee954884127 Cezary Rojewski      2022-02-14  136  {
fefee954884127 Cezary Rojewski      2022-02-14  137  	struct hdac_ext_link *hlink;
fefee954884127 Cezary Rojewski      2022-02-14  138  
fefee954884127 Cezary Rojewski      2022-02-14  139  	list_for_each_entry(hlink, &bus->hlink_list, list)
fefee954884127 Cezary Rojewski      2022-02-14 @140  		if (hlink->lsdiid & (0x1 << addr))
fefee954884127 Cezary Rojewski      2022-02-14  141  			return hlink;
fefee954884127 Cezary Rojewski      2022-02-14  142  	return NULL;
fefee954884127 Cezary Rojewski      2022-02-14  143  }
877908ab3f4972 Pierre-Louis Bossart 2022-10-19  144  EXPORT_SYMBOL_GPL(snd_hdac_ext_bus_get_hlink_by_addr);
fefee954884127 Cezary Rojewski      2022-02-14  145  
0b00a5615dc40c Jeeja KP             2015-06-11  146  /**
877908ab3f4972 Pierre-Louis Bossart 2022-10-19  147   * snd_hdac_ext_bus_get_hlink_by_name - get hlink based on codec name
6e57188f20ecf3 Keyon Jie            2020-01-13  148   * @bus: the pointer to HDAC bus object
0b00a5615dc40c Jeeja KP             2015-06-11  149   * @codec_name: codec name
0b00a5615dc40c Jeeja KP             2015-06-11  150   */
877908ab3f4972 Pierre-Louis Bossart 2022-10-19  151  struct hdac_ext_link *snd_hdac_ext_bus_get_hlink_by_name(struct hdac_bus *bus,
0b00a5615dc40c Jeeja KP             2015-06-11  152  							 const char *codec_name)
0b00a5615dc40c Jeeja KP             2015-06-11  153  {
0b00a5615dc40c Jeeja KP             2015-06-11  154  	int bus_idx, addr;
0b00a5615dc40c Jeeja KP             2015-06-11  155  
0b00a5615dc40c Jeeja KP             2015-06-11  156  	if (sscanf(codec_name, "ehdaudio%dD%d", &bus_idx, &addr) != 2)
0b00a5615dc40c Jeeja KP             2015-06-11  157  		return NULL;
76f56fae1cf904 Rakesh Ughreja       2018-06-01  158  	if (bus->idx != bus_idx)
0b00a5615dc40c Jeeja KP             2015-06-11  159  		return NULL;
158e1886b6262c Dan Carpenter        2020-11-03 @160  	if (addr < 0 || addr > 31)
158e1886b6262c Dan Carpenter        2020-11-03  161  		return NULL;
0b00a5615dc40c Jeeja KP             2015-06-11  162  
877908ab3f4972 Pierre-Louis Bossart 2022-10-19  163  	return snd_hdac_ext_bus_get_hlink_by_addr(bus, addr);
0b00a5615dc40c Jeeja KP             2015-06-11  164  }
877908ab3f4972 Pierre-Louis Bossart 2022-10-19  165  EXPORT_SYMBOL_GPL(snd_hdac_ext_bus_get_hlink_by_name);
0b00a5615dc40c Jeeja KP             2015-06-11  166  

:::::: The code at line 140 was first introduced by commit
:::::: fefee95488412796b293d28c948be6fce63d149b ALSA: hda: Add snd_hdac_ext_bus_link_at() helper

:::::: TO: Cezary Rojewski <cezary.rojewski@intel.com>
:::::: CC: Takashi Iwai <tiwai@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
