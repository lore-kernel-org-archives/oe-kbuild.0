Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94FE87E
	for <oe-kbuild@lists.linux.dev>; Mon,  6 Mar 2023 08:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678092839; x=1709628839;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tvel5ud0cbp5ubCP2LBAJFWofJOYnczaDScUZL8EQ9w=;
  b=N6S8XgnmwcPCjeh89sxbMUuA1HEypE1h1HmJdcb37hJuKZqwBxvUEF+B
   1XbUOjpNCEOAYquv6slqqfvp0wr72pfH6ekuUYeeMFlnixl1THqgA65Lu
   OKpgxcWyfD0AFjaMj9yiJawh6qn/JNYIY3TFiArSMEm/BDNHuqQF14M62
   8qhYcmQr8l6lPtJKcurss7w/ABOSTHgnc8lXIi9uysfwvMG64EAuPnTRt
   tWGeZbTz1ZctzkYwCcR2dSJfmAfXCcyrDeeah9iGudGh5VqnV5KsIdo9x
   fDjnSFf1DS1vku2vH+VQ/OxxMU0C8GW6h1XwSh8M69TJwp1/ey4kSdYCx
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="421779127"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; 
   d="scan'208";a="421779127"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2023 00:53:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="706366477"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; 
   d="scan'208";a="706366477"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 06 Mar 2023 00:53:55 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZ6bT-0000An-0N;
	Mon, 06 Mar 2023 08:53:55 +0000
Date: Mon, 6 Mar 2023 16:53:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: net/bluetooth/hci_core.c:3179:18: warning: Value stored to 'hdev'
 during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Message-ID: <202303061617.Qy7vptcz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: net/bluetooth/hci_core.c:3179:18: warning: Value stored to 'hdev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fe15c26ee26efa11741a7b632e9f23b01aca4cc6
commit: 26afbd826ee326e63a334c37fd45e82e50a615ec Bluetooth: Add initial implementation of CIS connections
date:   8 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 8 months ago
config: arm-randconfig-c002-20230302 (https://download.01.org/0day-ci/archive/20230306/202303061617.Qy7vptcz-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=26afbd826ee326e63a334c37fd45e82e50a615ec
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 26afbd826ee326e63a334c37fd45e82e50a615ec
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303061617.Qy7vptcz-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
                   ^~~~~~
   net/bluetooth/hci_core.c:1580:3: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(data->rand192, rand192, sizeof(data->rand192));
                   ^~~~~~
   net/bluetooth/hci_core.c:1584:3: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(data->hash192, 0, sizeof(data->hash192));
                   ^~~~~~
   net/bluetooth/hci_core.c:1584:3: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
                   memset(data->hash192, 0, sizeof(data->hash192));
                   ^~~~~~
   net/bluetooth/hci_core.c:1585:3: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(data->rand192, 0, sizeof(data->rand192));
                   ^~~~~~
   net/bluetooth/hci_core.c:1585:3: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
                   memset(data->rand192, 0, sizeof(data->rand192));
                   ^~~~~~
   net/bluetooth/hci_core.c:1593:3: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(data->hash256, hash256, sizeof(data->hash256));
                   ^~~~~~
   net/bluetooth/hci_core.c:1593:3: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(data->hash256, hash256, sizeof(data->hash256));
                   ^~~~~~
   net/bluetooth/hci_core.c:1594:3: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(data->rand256, rand256, sizeof(data->rand256));
                   ^~~~~~
   net/bluetooth/hci_core.c:1594:3: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(data->rand256, rand256, sizeof(data->rand256));
                   ^~~~~~
   net/bluetooth/hci_core.c:1596:3: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(data->hash256, 0, sizeof(data->hash256));
                   ^~~~~~
   net/bluetooth/hci_core.c:1596:3: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
                   memset(data->hash256, 0, sizeof(data->hash256));
                   ^~~~~~
   net/bluetooth/hci_core.c:1597:3: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(data->rand256, 0, sizeof(data->rand256));
                   ^~~~~~
   net/bluetooth/hci_core.c:1597:3: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
                   memset(data->rand256, 0, sizeof(data->rand256));
                   ^~~~~~
   net/bluetooth/hci_core.c:1715:3: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(adv_instance->adv_data, 0,
                   ^~~~~~
   net/bluetooth/hci_core.c:1715:3: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
                   memset(adv_instance->adv_data, 0,
                   ^~~~~~
   net/bluetooth/hci_core.c:1717:3: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(adv_instance->scan_rsp_data, 0,
                   ^~~~~~
   net/bluetooth/hci_core.c:1717:3: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
                   memset(adv_instance->scan_rsp_data, 0,
                   ^~~~~~
   net/bluetooth/hci_core.c:1772:3: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(adv->adv_data, 0, sizeof(adv->adv_data));
                   ^~~~~~
   net/bluetooth/hci_core.c:1772:3: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
                   memset(adv->adv_data, 0, sizeof(adv->adv_data));
                   ^~~~~~
   net/bluetooth/hci_core.c:1773:3: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(adv->adv_data, adv_data, adv_data_len);
                   ^~~~~~
   net/bluetooth/hci_core.c:1773:3: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(adv->adv_data, adv_data, adv_data_len);
                   ^~~~~~
   net/bluetooth/hci_core.c:1779:3: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(adv->scan_rsp_data, 0, sizeof(adv->scan_rsp_data));
                   ^~~~~~
   net/bluetooth/hci_core.c:1779:3: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
                   memset(adv->scan_rsp_data, 0, sizeof(adv->scan_rsp_data));
                   ^~~~~~
   net/bluetooth/hci_core.c:1780:3: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(adv->scan_rsp_data, scan_rsp_data, scan_rsp_len);
                   ^~~~~~
   net/bluetooth/hci_core.c:1780:3: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(adv->scan_rsp_data, scan_rsp_data, scan_rsp_len);
                   ^~~~~~
   net/bluetooth/hci_core.c:2108:3: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(entry->peer_irk, peer_irk, 16);
                   ^~~~~~
   net/bluetooth/hci_core.c:2108:3: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(entry->peer_irk, peer_irk, 16);
                   ^~~~~~
   net/bluetooth/hci_core.c:2111:3: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(entry->local_irk, local_irk, 16);
                   ^~~~~~
   net/bluetooth/hci_core.c:2111:3: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(entry->local_irk, local_irk, 16);
                   ^~~~~~
   net/bluetooth/hci_core.c:2549:2: warning: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(hdev->name, sizeof(hdev->name), "hci%d", id);
           ^~~~~~~~
   net/bluetooth/hci_core.c:2549:2: note: Call to function 'snprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(hdev->name, sizeof(hdev->name), "hci%d", id);
           ^~~~~~~~
   net/bluetooth/hci_core.c:3155:2: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(skb_transport_header(skb), &hdr, HCI_SCO_HDR_SIZE);
           ^~~~~~
   net/bluetooth/hci_core.c:3155:2: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(skb_transport_header(skb), &hdr, HCI_SCO_HDR_SIZE);
           ^~~~~~
>> net/bluetooth/hci_core.c:3179:18: warning: Value stored to 'hdev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct hci_dev *hdev = conn->hdev;
                           ^~~~   ~~~~~~~~~~
   net/bluetooth/hci_core.c:3179:18: note: Value stored to 'hdev' during its initialization is never read
           struct hci_dev *hdev = conn->hdev;
                           ^~~~   ~~~~~~~~~~
   net/bluetooth/hci_core.c:3815:2: warning: Value stored to 'flags' is never read [clang-analyzer-deadcode.DeadStores]
           flags  = hci_flags(handle);
           ^
   net/bluetooth/hci_core.c:3815:2: note: Value stored to 'flags' is never read
   Suppressed 68 warnings (68 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   118 warnings generated.
   net/core/rtnetlink.c:204:9: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           return rcu_dereference_rtnl(tab[msgtype]);
                  ^
   include/linux/rtnetlink.h:61:2: note: expanded from macro 'rcu_dereference_rtnl'
           rcu_dereference_check(p, lockdep_rtnl_is_held())
           ^
   include/linux/rcupdate.h:532:2: note: expanded from macro 'rcu_dereference_check'
           __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
           ^
   include/linux/rcupdate.h:392:43: note: expanded from macro '__rcu_dereference_check'
           typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
                                                    ^
   include/asm-generic/rwonce.h:50:2: note: expanded from macro 'READ_ONCE'
           __READ_ONCE(x);                                                 \
           ^
   include/asm-generic/rwonce.h:44:24: note: expanded from macro '__READ_ONCE'
   #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
                           ^
   net/core/rtnetlink.c:5998:6: note: Assuming the condition is false
           if (type > RTM_MAX)
               ^~~~~~~~~~~~~~
   net/core/rtnetlink.c:5998:2: note: Taking false branch
           if (type > RTM_MAX)
           ^
   net/core/rtnetlink.c:6004:6: note: Assuming the condition is false
           if (nlmsg_len(nlh) < sizeof(struct rtgenmsg))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/rtnetlink.c:6004:2: note: Taking false branch
           if (nlmsg_len(nlh) < sizeof(struct rtgenmsg))
           ^
   net/core/rtnetlink.c:6010:6: note: Assuming 'kind' is equal to RTNL_KIND_GET
           if (kind != RTNL_KIND_GET && !netlink_net_capable(skb, CAP_NET_ADMIN))
               ^~~~~~~~~~~~~~~~~~~~~
   net/core/rtnetlink.c:6010:28: note: Left side of '&&' is false
           if (kind != RTNL_KIND_GET && !netlink_net_capable(skb, CAP_NET_ADMIN))
                                     ^
   net/core/rtnetlink.c:6014:6: note: 'kind' is equal to RTNL_KIND_GET
           if (kind == RTNL_KIND_GET && (nlh->nlmsg_flags & NLM_F_DUMP)) {
               ^~~~
   net/core/rtnetlink.c:6014:6: note: Left side of '&&' is true
   net/core/rtnetlink.c:6014:32: note: Assuming the condition is false
           if (kind == RTNL_KIND_GET && (nlh->nlmsg_flags & NLM_F_DUMP)) {
                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/rtnetlink.c:6014:2: note: Taking false branch
           if (kind == RTNL_KIND_GET && (nlh->nlmsg_flags & NLM_F_DUMP)) {
           ^
   net/core/rtnetlink.c:6055:9: note: Calling 'rtnl_get_link'
           link = rtnl_get_link(family, type);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/rtnetlink.c:197:6: note: Assuming the condition is true
           if (protocol >= ARRAY_SIZE(rtnl_msg_handlers))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/rtnetlink.c:197:2: note: Taking true branch
           if (protocol >= ARRAY_SIZE(rtnl_msg_handlers))
           ^
   net/core/rtnetlink.c:200:8: note: Left side of '||' is false
           tab = rcu_dereference_rtnl(rtnl_msg_handlers[protocol]);
                 ^
   include/linux/rtnetlink.h:61:2: note: expanded from macro 'rcu_dereference_rtnl'
           rcu_dereference_check(p, lockdep_rtnl_is_held())
           ^
   include/linux/rcupdate.h:532:2: note: expanded from macro 'rcu_dereference_check'
           __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
           ^
   include/linux/rcupdate.h:392:43: note: expanded from macro '__rcu_dereference_check'
           typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
                                                    ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compiletime_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
                              ^
   include/linux/compiler_types.h:321:3: note: expanded from macro '__native_word'
           (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
            ^
   net/core/rtnetlink.c:200:8: note: Left side of '||' is false
           tab = rcu_dereference_rtnl(rtnl_msg_handlers[protocol]);
                 ^
   include/linux/rtnetlink.h:61:2: note: expanded from macro 'rcu_dereference_rtnl'
           rcu_dereference_check(p, lockdep_rtnl_is_held())
           ^
   include/linux/rcupdate.h:532:2: note: expanded from macro 'rcu_dereference_check'
           __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
           ^
   include/linux/rcupdate.h:392:43: note: expanded from macro '__rcu_dereference_check'
           typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
                                                    ^

vim +/hdev +3179 net/bluetooth/hci_core.c

26afbd826ee326 Luiz Augusto von Dentz 2019-07-29  3175  
26afbd826ee326 Luiz Augusto von Dentz 2019-07-29  3176  static void hci_queue_iso(struct hci_conn *conn, struct sk_buff_head *queue,
26afbd826ee326 Luiz Augusto von Dentz 2019-07-29  3177  			  struct sk_buff *skb)
26afbd826ee326 Luiz Augusto von Dentz 2019-07-29  3178  {
26afbd826ee326 Luiz Augusto von Dentz 2019-07-29 @3179  	struct hci_dev *hdev = conn->hdev;
26afbd826ee326 Luiz Augusto von Dentz 2019-07-29  3180  	struct sk_buff *list;
26afbd826ee326 Luiz Augusto von Dentz 2019-07-29  3181  	__u16 flags;
26afbd826ee326 Luiz Augusto von Dentz 2019-07-29  3182  
26afbd826ee326 Luiz Augusto von Dentz 2019-07-29  3183  	skb->len = skb_headlen(skb);
26afbd826ee326 Luiz Augusto von Dentz 2019-07-29  3184  	skb->data_len = 0;
26afbd826ee326 Luiz Augusto von Dentz 2019-07-29  3185  
26afbd826ee326 Luiz Augusto von Dentz 2019-07-29  3186  	hci_skb_pkt_type(skb) = HCI_ISODATA_PKT;
26afbd826ee326 Luiz Augusto von Dentz 2019-07-29  3187  
26afbd826ee326 Luiz Augusto von Dentz 2019-07-29  3188  	list = skb_shinfo(skb)->frag_list;
26afbd826ee326 Luiz Augusto von Dentz 2019-07-29  3189  
26afbd826ee326 Luiz Augusto von Dentz 2019-07-29  3190  	flags = hci_iso_flags_pack(list ? ISO_START : ISO_SINGLE, 0x00);
26afbd826ee326 Luiz Augusto von Dentz 2019-07-29  3191  	hci_add_iso_hdr(skb, conn->handle, flags);
26afbd826ee326 Luiz Augusto von Dentz 2019-07-29  3192  
26afbd826ee326 Luiz Augusto von Dentz 2019-07-29  3193  	if (!list) {
26afbd826ee326 Luiz Augusto von Dentz 2019-07-29  3194  		/* Non fragmented */
26afbd826ee326 Luiz Augusto von Dentz 2019-07-29  3195  		BT_DBG("%s nonfrag skb %p len %d", hdev->name, skb, skb->len);
26afbd826ee326 Luiz Augusto von Dentz 2019-07-29  3196  
26afbd826ee326 Luiz Augusto von Dentz 2019-07-29  3197  		skb_queue_tail(queue, skb);
26afbd826ee326 Luiz Augusto von Dentz 2019-07-29  3198  	} else {
26afbd826ee326 Luiz Augusto von Dentz 2019-07-29  3199  		/* Fragmented */
26afbd826ee326 Luiz Augusto von Dentz 2019-07-29  3200  		BT_DBG("%s frag %p len %d", hdev->name, skb, skb->len);
26afbd826ee326 Luiz Augusto von Dentz 2019-07-29  3201  
26afbd826ee326 Luiz Augusto von Dentz 2019-07-29  3202  		skb_shinfo(skb)->frag_list = NULL;
26afbd826ee326 Luiz Augusto von Dentz 2019-07-29  3203  
26afbd826ee326 Luiz Augusto von Dentz 2019-07-29  3204  		__skb_queue_tail(queue, skb);
26afbd826ee326 Luiz Augusto von Dentz 2019-07-29  3205  
26afbd826ee326 Luiz Augusto von Dentz 2019-07-29  3206  		do {
26afbd826ee326 Luiz Augusto von Dentz 2019-07-29  3207  			skb = list; list = list->next;
26afbd826ee326 Luiz Augusto von Dentz 2019-07-29  3208  
26afbd826ee326 Luiz Augusto von Dentz 2019-07-29  3209  			hci_skb_pkt_type(skb) = HCI_ISODATA_PKT;
26afbd826ee326 Luiz Augusto von Dentz 2019-07-29  3210  			flags = hci_iso_flags_pack(list ? ISO_CONT : ISO_END,
26afbd826ee326 Luiz Augusto von Dentz 2019-07-29  3211  						   0x00);
26afbd826ee326 Luiz Augusto von Dentz 2019-07-29  3212  			hci_add_iso_hdr(skb, conn->handle, flags);
26afbd826ee326 Luiz Augusto von Dentz 2019-07-29  3213  
26afbd826ee326 Luiz Augusto von Dentz 2019-07-29  3214  			BT_DBG("%s frag %p len %d", hdev->name, skb, skb->len);
26afbd826ee326 Luiz Augusto von Dentz 2019-07-29  3215  
26afbd826ee326 Luiz Augusto von Dentz 2019-07-29  3216  			__skb_queue_tail(queue, skb);
26afbd826ee326 Luiz Augusto von Dentz 2019-07-29  3217  		} while (list);
26afbd826ee326 Luiz Augusto von Dentz 2019-07-29  3218  	}
26afbd826ee326 Luiz Augusto von Dentz 2019-07-29  3219  }
26afbd826ee326 Luiz Augusto von Dentz 2019-07-29  3220  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
