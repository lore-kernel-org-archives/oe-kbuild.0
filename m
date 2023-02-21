Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CFEF8F78
	for <oe-kbuild@lists.linux.dev>; Tue, 21 Feb 2023 21:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677016125; x=1708552125;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=p2kDqzTSFToE8V5XEFsZ12n608AArJeZubM17aUkxTQ=;
  b=mNWygpQyR5xVBvR0hq4k1MN5sbajQB3hHV7X2njr5lTVs6IhHQP+NDT4
   NlrSoAhoSfAs4YACKA10gKzv0k0X2dJ95v/FzxnA/e5uG5TL8I4yrD/10
   yLpvwUCQA9zlDBMX9vGAT7bxKydR3lELeR85iJtoKKqb47lsI1pbwwMMJ
   lBhJ8WKfRDZI4mKGfwjkWAd8gpoyACDW6rY1g9/EGeWNuGnztGprHOziZ
   Xg5HKXj4PyngAe4MTHPh3z8+kgSDDbzmD/iO6JLnDBZKqWy+E9hG5WyCy
   IkiozI4al0wg2QOVjghjsJKZpn8WXcv1erafrfZXd1JXy5IxjDVwnbYfh
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="316486734"
X-IronPort-AV: E=Sophos;i="5.97,317,1669104000"; 
   d="scan'208";a="316486734"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2023 13:48:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="845861308"
X-IronPort-AV: E=Sophos;i="5.97,317,1669104000"; 
   d="scan'208";a="845861308"
Received: from lkp-server01.sh.intel.com (HELO eac18b5d7d93) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 21 Feb 2023 13:48:43 -0800
Received: from kbuild by eac18b5d7d93 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pUaV8-0000H7-2C;
	Tue, 21 Feb 2023 21:48:42 +0000
Date: Wed, 22 Feb 2023 05:48:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 4314/13664]
 drivers/hid/hid-uclogic-core.c:271:13: warning: Uninitialized variable:
 curr->size [uninitvar]
Message-ID: <202302220533.NdB33vhq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/hid/hid-uclogic-core.c:271:13: warning: Uninitialized variable: curr->size [uninitvar]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: "José Expósito" <jose.exposito89@gmail.com>
CC: Jiri Kosina <jkosina@suse.cz>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   465461cf48465b8a0a54025db5ae2b3df7a04577
commit: a251d6576d2a29fc0806ef4775719e3b6e672d91 [4314/13664] HID: uclogic: Handle wireless device reconnection
:::::: branch date: 16 hours ago
:::::: commit date: 5 weeks ago
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout a251d6576d2a29fc0806ef4775719e3b6e672d91
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202302220533.NdB33vhq-lkp@intel.com/


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/hid/hid-uclogic-core.c:271:13: warning: Uninitialized variable: curr->size [uninitvar]
     if (curr->size == size && memcmp(curr->event, event, size) == 0) {
               ^
   drivers/hid/hid-uclogic-core.c:267:6: note: Assuming condition is false
    if (!p->event_hooks)
        ^
   drivers/hid/hid-uclogic-core.c:271:13: note: Uninitialized variable: curr->size
     if (curr->size == size && memcmp(curr->event, event, size) == 0) {
               ^
>> drivers/hwmon/nct6775-core.c:1868:9: warning: %d in format string (no. 1) requires 'int' but the argument type is 'unsigned int'. [invalidPrintfArgType_sint]
    return sprintf(buf, "%dn", data->rpm[nr]);
           ^
   drivers/hwmon/nct6775-core.c:1881:9: warning: %d in format string (no. 1) requires 'int' but the argument type is 'unsigned int'. [invalidPrintfArgType_sint]
    return sprintf(buf, "%dn",
           ^
   drivers/hwmon/nct6775-core.c:2799:9: warning: %d in format string (no. 1) requires 'int' but the argument type is 'unsigned int'. [invalidPrintfArgType_sint]
    return sprintf(buf, "%dn",
           ^
   drivers/hwmon/nct6775-core.c:3017:9: warning: %d in format string (no. 1) requires 'int' but the argument type is 'unsigned int'. [invalidPrintfArgType_sint]
    return sprintf(buf, "%dn",
           ^

vim +271 drivers/hid/hid-uclogic-core.c

251b427566e2cf Nikolai Kondrashov 2019-02-10  251  
a251d6576d2a29 José Expósito      2022-12-26  252  /**
a251d6576d2a29 José Expósito      2022-12-26  253   * uclogic_exec_event_hook - if the received event is hooked schedules the
a251d6576d2a29 José Expósito      2022-12-26  254   * associated work.
a251d6576d2a29 José Expósito      2022-12-26  255   *
a251d6576d2a29 José Expósito      2022-12-26  256   * @p:		Tablet interface report parameters.
a251d6576d2a29 José Expósito      2022-12-26  257   * @event:	Raw event.
a251d6576d2a29 José Expósito      2022-12-26  258   * @size:	The size of event.
a251d6576d2a29 José Expósito      2022-12-26  259   *
a251d6576d2a29 José Expósito      2022-12-26  260   * Returns:
a251d6576d2a29 José Expósito      2022-12-26  261   *	Whether the event was hooked or not.
a251d6576d2a29 José Expósito      2022-12-26  262   */
a251d6576d2a29 José Expósito      2022-12-26  263  static bool uclogic_exec_event_hook(struct uclogic_params *p, u8 *event, int size)
a251d6576d2a29 José Expósito      2022-12-26  264  {
a251d6576d2a29 José Expósito      2022-12-26  265  	struct uclogic_raw_event_hook *curr;
a251d6576d2a29 José Expósito      2022-12-26  266  
a251d6576d2a29 José Expósito      2022-12-26  267  	if (!p->event_hooks)
a251d6576d2a29 José Expósito      2022-12-26  268  		return false;
a251d6576d2a29 José Expósito      2022-12-26  269  
a251d6576d2a29 José Expósito      2022-12-26  270  	list_for_each_entry(curr, &p->event_hooks->list, list) {
a251d6576d2a29 José Expósito      2022-12-26 @271  		if (curr->size == size && memcmp(curr->event, event, size) == 0) {
a251d6576d2a29 José Expósito      2022-12-26  272  			schedule_work(&curr->work);
a251d6576d2a29 José Expósito      2022-12-26  273  			return true;
a251d6576d2a29 José Expósito      2022-12-26  274  		}
a251d6576d2a29 José Expósito      2022-12-26  275  	}
a251d6576d2a29 José Expósito      2022-12-26  276  
a251d6576d2a29 José Expósito      2022-12-26  277  	return false;
a251d6576d2a29 José Expósito      2022-12-26  278  }
a251d6576d2a29 José Expósito      2022-12-26  279  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
