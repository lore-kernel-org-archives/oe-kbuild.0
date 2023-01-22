Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD6B97E
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Jan 2023 15:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674400292; x=1705936292;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lMmkxyJ4KDTAsSGhhgMWJCtALLd9qC93caTZ+OGYdi4=;
  b=IySp3X1dC8sL9OwNPi4z2fhW1LUd8EfEQe02hRM5oHEIrWqEGeu9ZBTF
   bAGmmKh8UqJTFIFWBlNsjFRVfdwxTUXt1/khgcEFezprHp5e/3npccNlb
   iRsnG14qHHUE8o70/0x+kLI37uVkHehmz3KULh17G/2wH40F7A7/D0s0T
   AcrnTZdi/PY/zzsKvTqDQq5ZJfU4nIg52qDRmVTaLcguM9bwKbAcVBQJa
   xS0LZu7s3c+5cKnIQS0DKPbXd3YykUWNC8Wmj4YWDAHUSgp/Ao+b4+RPD
   f9DPln4NfxS6H5OYV3PrMoIllf7oBV69YiXuVXPChapdPTa0Eakf9+cmc
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10597"; a="306257082"
X-IronPort-AV: E=Sophos;i="5.97,237,1669104000"; 
   d="scan'208";a="306257082"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2023 07:11:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10597"; a="785304353"
X-IronPort-AV: E=Sophos;i="5.97,237,1669104000"; 
   d="scan'208";a="785304353"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 22 Jan 2023 07:11:30 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pJc0I-00054C-0M;
	Sun, 22 Jan 2023 15:11:30 +0000
Date: Sun, 22 Jan 2023 23:11:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [cel:topic-rpcsec-gss-krb5-enhancements 90/109]
 net/sunrpc/auth_gss/gss_krb5_crypto.c:659:37: warning: Division by zero
 [clang-analyzer-core.DivideZero]
Message-ID: <202301222353.A6pEXSpk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: net/sunrpc/auth_gss/gss_krb5_crypto.c:659:37: warning: Division by zero [clang-analyzer-core.DivideZero]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Chuck Lever <chuck.lever@oracle.com>

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux topic-rpcsec-gss-krb5-enhancements
head:   3f681aeac65cc78e50b0a7330ad6fe9eb715f164
commit: c19e6f0d612ee3849eebbad643a9623bf7bc6214 [90/109] SUNRPC: Refactor CBC with CTS into helpers
:::::: branch date: 5 days ago
:::::: commit date: 7 days ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/20230122/202301222353.A6pEXSpk-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux.git/commit/?id=c19e6f0d612ee3849eebbad643a9623bf7bc6214
        git remote add cel git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux
        git fetch --no-tags cel topic-rpcsec-gss-krb5-enhancements
        git checkout c19e6f0d612ee3849eebbad643a9623bf7bc6214
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=x86_64 clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=x86_64 clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

clang_analyzer warnings: (new ones prefixed by >>)
           ^
   include/linux/dynamic_debug.h:222:2: note: expanded from macro '__dynamic_func_call_cls'
           if (DYNAMIC_DEBUG_BRANCH(id))                           \
           ^
   net/mptcp/pm_netlink.c:745:2: note: Loop condition is false.  Exiting loop
           pr_debug("bkup=%d", bkup);
           ^
   include/linux/printk.h:581:2: note: expanded from macro 'pr_debug'
           dynamic_pr_debug(fmt, ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:268:2: note: expanded from macro 'dynamic_pr_debug'
           _dynamic_func_call(fmt, __dynamic_pr_debug,             \
           ^
   include/linux/dynamic_debug.h:249:2: note: expanded from macro '_dynamic_func_call'
           _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:247:2: note: expanded from macro '_dynamic_func_call_cls'
           __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:220:58: note: expanded from macro '__dynamic_func_call_cls'
   #define __dynamic_func_call_cls(id, cls, fmt, func, ...) do {   \
                                                            ^
   net/mptcp/pm_netlink.c:747:2: note: Loop condition is true.  Entering loop body
           mptcp_for_each_subflow(msk, subflow) {
           ^
   net/mptcp/protocol.h:327:2: note: expanded from macro 'mptcp_for_each_subflow'
           list_for_each_entry(__subflow, &((__msk)->conn_list), node)
           ^
   include/linux/list.h:674:2: note: expanded from macro 'list_for_each_entry'
           for (pos = list_first_entry(head, typeof(*pos), member);        \
           ^
   net/mptcp/pm_netlink.c:751:3: note: Calling 'local_address'
                   local_address((struct sock_common *)ssk, &local);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mptcp/pm_netlink.c:94:6: note: Assuming field 'family' is not equal to AF_INET
           if (addr->family == AF_INET)
               ^~~~~~~~~~~~~~~~~~~~~~~
   net/mptcp/pm_netlink.c:94:2: note: Taking false branch
           if (addr->family == AF_INET)
           ^
   net/mptcp/pm_netlink.c:97:11: note: Assuming field 'family' is not equal to AF_INET6
           else if (addr->family == AF_INET6)
                    ^~~~~~~~~~~~~~~~~~~~~~~~
   net/mptcp/pm_netlink.c:97:7: note: Taking false branch
           else if (addr->family == AF_INET6)
                ^
   net/mptcp/pm_netlink.c:751:3: note: Returning from 'local_address'
                   local_address((struct sock_common *)ssk, &local);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mptcp/pm_netlink.c:752:8: note: Calling 'mptcp_addresses_equal'
                   if (!mptcp_addresses_equal(&local, addr, addr->port))
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mptcp/pm_netlink.c:66:6: note: Assuming 'a->family' is not equal to 'b->family'
           if (a->family == b->family) {
               ^~~~~~~~~~~~~~~~~~~~~~
   net/mptcp/pm_netlink.c:66:2: note: Taking false branch
           if (a->family == b->family) {
           ^
   net/mptcp/pm_netlink.c:72:16: note: Field 'family' is not equal to AF_INET
           } else if (a->family == AF_INET) {
                         ^
   net/mptcp/pm_netlink.c:72:9: note: Taking false branch
           } else if (a->family == AF_INET) {
                  ^
   net/mptcp/pm_netlink.c:75:13: note: Assuming field 'family' is equal to AF_INET
           } else if (b->family == AF_INET) {
                      ^~~~~~~~~~~~~~~~~~~~
   net/mptcp/pm_netlink.c:75:9: note: Taking true branch
           } else if (b->family == AF_INET) {
                  ^
   net/mptcp/pm_netlink.c:76:7: note: Calling 'ipv6_addr_v4mapped'
                   if (ipv6_addr_v4mapped(&a->addr6))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/ipv6.h:786:43: note: The left operand of '^' is a garbage value
                   (__force unsigned long)(a->s6_addr32[2] ^
                                           ~~~~~~~~~~~~~~~ ^
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   9 warnings generated.
   net/sunrpc/auth_gss/gss_krb5_mech.c:184:3: warning: Call to function 'strcat' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcat(gss_krb5_enctype_priority_list, buf);
                   ^~~~~~
   net/sunrpc/auth_gss/gss_krb5_mech.c:184:3: note: Call to function 'strcat' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcat'. CWE-119
                   strcat(gss_krb5_enctype_priority_list, buf);
                   ^~~~~~
   Suppressed 8 warnings (7 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (7 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (7 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (7 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (7 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   9 warnings generated.
>> net/sunrpc/auth_gss/gss_krb5_crypto.c:659:37: warning: Division by zero [clang-analyzer-core.DivideZero]
           nblocks = (nbytes + blocksize - 1) / blocksize;
                                              ^
   net/sunrpc/auth_gss/gss_krb5_crypto.c:750:6: note: Assuming field 'initiate' is 0
           if (kctx->initiate) {
               ^~~~~~~~~~~~~~
   net/sunrpc/auth_gss/gss_krb5_crypto.c:750:2: note: Taking false branch
           if (kctx->initiate) {
           ^
   net/sunrpc/auth_gss/gss_krb5_crypto.c:763:6: note: Calling 'xdr_extend_head'
           if (xdr_extend_head(buf, offset, conflen))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sunrpc/auth_gss/gss_krb5_crypto.c:572:6: note: Assuming 'shiftlen' is equal to 0
           if (shiftlen == 0)
               ^~~~~~~~~~~~~
   net/sunrpc/auth_gss/gss_krb5_crypto.c:572:2: note: Taking true branch
           if (shiftlen == 0)
           ^
   net/sunrpc/auth_gss/gss_krb5_crypto.c:763:6: note: Returning from 'xdr_extend_head'
           if (xdr_extend_head(buf, offset, conflen))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sunrpc/auth_gss/gss_krb5_crypto.c:763:2: note: Taking false branch
           if (xdr_extend_head(buf, offset, conflen))
           ^
   net/sunrpc/auth_gss/gss_krb5_crypto.c:768:6: note: Assuming field 'iov_base' is not equal to NULL
           if (buf->tail[0].iov_base != NULL) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sunrpc/auth_gss/gss_krb5_crypto.c:768:2: note: Taking true branch
           if (buf->tail[0].iov_base != NULL) {
           ^
   net/sunrpc/auth_gss/gss_krb5_crypto.c:778:2: note: '__ret_cond' is false
           memcpy(ecptr, buf->head[0].iov_base + offset, GSS_KRB5_TOK_HDR_LEN);
           ^
   include/linux/fortify-string.h:623:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:571:2: note: expanded from macro '__fortify_memcpy_chk'
           WARN_ONCE(fortify_memcpy_chk(__fortify_size, __p_size,          \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:151:2: note: expanded from macro 'WARN_ONCE'
           DO_ONCE_LITE_IF(condition, WARN, 1, format)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/once_lite.h:30:7: note: expanded from macro 'DO_ONCE_LITE_IF'
                   if (__ONCE_LITE_IF(__ret_do_once))                      \
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/once_lite.h:19:16: note: expanded from macro '__ONCE_LITE_IF'
                   if (unlikely(__ret_cond && !__already_done)) {          \
                                ^~~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   net/sunrpc/auth_gss/gss_krb5_crypto.c:778:2: note: Left side of '&&' is false
           memcpy(ecptr, buf->head[0].iov_base + offset, GSS_KRB5_TOK_HDR_LEN);
           ^
   include/linux/fortify-string.h:623:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^
   include/linux/fortify-string.h:571:2: note: expanded from macro '__fortify_memcpy_chk'
           WARN_ONCE(fortify_memcpy_chk(__fortify_size, __p_size,          \
           ^
   include/asm-generic/bug.h:151:2: note: expanded from macro 'WARN_ONCE'
           DO_ONCE_LITE_IF(condition, WARN, 1, format)
           ^
   include/linux/once_lite.h:30:7: note: expanded from macro 'DO_ONCE_LITE_IF'
                   if (__ONCE_LITE_IF(__ret_do_once))                      \
                       ^
   include/linux/once_lite.h:19:27: note: expanded from macro '__ONCE_LITE_IF'
                   if (unlikely(__ret_cond && !__already_done)) {          \
                                           ^
   net/sunrpc/auth_gss/gss_krb5_crypto.c:778:2: note: Taking false branch
           memcpy(ecptr, buf->head[0].iov_base + offset, GSS_KRB5_TOK_HDR_LEN);
           ^
   include/linux/fortify-string.h:623:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^
   include/linux/fortify-string.h:571:2: note: expanded from macro '__fortify_memcpy_chk'
           WARN_ONCE(fortify_memcpy_chk(__fortify_size, __p_size,          \
           ^
   include/asm-generic/bug.h:151:2: note: expanded from macro 'WARN_ONCE'
           DO_ONCE_LITE_IF(condition, WARN, 1, format)
           ^
   include/linux/once_lite.h:30:7: note: expanded from macro 'DO_ONCE_LITE_IF'
                   if (__ONCE_LITE_IF(__ret_do_once))                      \
                       ^
   include/linux/once_lite.h:19:3: note: expanded from macro '__ONCE_LITE_IF'
                   if (unlikely(__ret_cond && !__already_done)) {          \
                   ^
   net/sunrpc/auth_gss/gss_krb5_crypto.c:778:2: note: Taking false branch
           memcpy(ecptr, buf->head[0].iov_base + offset, GSS_KRB5_TOK_HDR_LEN);
           ^
   include/linux/fortify-string.h:623:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^
   include/linux/fortify-string.h:571:2: note: expanded from macro '__fortify_memcpy_chk'
           WARN_ONCE(fortify_memcpy_chk(__fortify_size, __p_size,          \
           ^
   include/asm-generic/bug.h:151:2: note: expanded from macro 'WARN_ONCE'
           DO_ONCE_LITE_IF(condition, WARN, 1, format)
           ^
   include/linux/once_lite.h:30:3: note: expanded from macro 'DO_ONCE_LITE_IF'
                   if (__ONCE_LITE_IF(__ret_do_once))                      \

vim +659 net/sunrpc/auth_gss/gss_krb5_crypto.c

934a95aa1c9c6a Kevin Coffman 2010-03-17  643  
c19e6f0d612ee3 Chuck Lever   2022-12-14  644  /*
c19e6f0d612ee3 Chuck Lever   2022-12-14  645   * To provide confidentiality, encrypt using cipher block chaining
c19e6f0d612ee3 Chuck Lever   2022-12-14  646   * with ciphertext stealing. Message integrity is handled separately.
c19e6f0d612ee3 Chuck Lever   2022-12-14  647   */
c19e6f0d612ee3 Chuck Lever   2022-12-14  648  static int
c19e6f0d612ee3 Chuck Lever   2022-12-14  649  krb5_cbc_cts_encrypt(struct crypto_sync_skcipher *cts_tfm,
c19e6f0d612ee3 Chuck Lever   2022-12-14  650  		     struct crypto_sync_skcipher *cbc_tfm,
c19e6f0d612ee3 Chuck Lever   2022-12-14  651  		     u32 offset, struct xdr_buf *buf, struct page **pages)
c19e6f0d612ee3 Chuck Lever   2022-12-14  652  {
c19e6f0d612ee3 Chuck Lever   2022-12-14  653  	u32 blocksize, nbytes, nblocks, cbcbytes;
c19e6f0d612ee3 Chuck Lever   2022-12-14  654  	struct encryptor_desc desc;
c19e6f0d612ee3 Chuck Lever   2022-12-14  655  	int err;
c19e6f0d612ee3 Chuck Lever   2022-12-14  656  
c19e6f0d612ee3 Chuck Lever   2022-12-14  657  	blocksize = crypto_sync_skcipher_blocksize(cts_tfm);
c19e6f0d612ee3 Chuck Lever   2022-12-14  658  	nbytes = buf->len - offset;
c19e6f0d612ee3 Chuck Lever   2022-12-14 @659  	nblocks = (nbytes + blocksize - 1) / blocksize;
c19e6f0d612ee3 Chuck Lever   2022-12-14  660  	cbcbytes = 0;
c19e6f0d612ee3 Chuck Lever   2022-12-14  661  	if (nblocks > 2)
c19e6f0d612ee3 Chuck Lever   2022-12-14  662  		cbcbytes = (nblocks - 2) * blocksize;
c19e6f0d612ee3 Chuck Lever   2022-12-14  663  
c19e6f0d612ee3 Chuck Lever   2022-12-14  664  	memset(desc.iv, 0, sizeof(desc.iv));
c19e6f0d612ee3 Chuck Lever   2022-12-14  665  
c19e6f0d612ee3 Chuck Lever   2022-12-14  666  	/* Handle block-sized chunks of plaintext with CBC. */
c19e6f0d612ee3 Chuck Lever   2022-12-14  667  	if (cbcbytes) {
c19e6f0d612ee3 Chuck Lever   2022-12-14  668  		SYNC_SKCIPHER_REQUEST_ON_STACK(req, cbc_tfm);
c19e6f0d612ee3 Chuck Lever   2022-12-14  669  
c19e6f0d612ee3 Chuck Lever   2022-12-14  670  		desc.pos = offset;
c19e6f0d612ee3 Chuck Lever   2022-12-14  671  		desc.fragno = 0;
c19e6f0d612ee3 Chuck Lever   2022-12-14  672  		desc.fraglen = 0;
c19e6f0d612ee3 Chuck Lever   2022-12-14  673  		desc.pages = pages;
c19e6f0d612ee3 Chuck Lever   2022-12-14  674  		desc.outbuf = buf;
c19e6f0d612ee3 Chuck Lever   2022-12-14  675  		desc.req = req;
c19e6f0d612ee3 Chuck Lever   2022-12-14  676  
c19e6f0d612ee3 Chuck Lever   2022-12-14  677  		skcipher_request_set_sync_tfm(req, cbc_tfm);
c19e6f0d612ee3 Chuck Lever   2022-12-14  678  		skcipher_request_set_callback(req, 0, NULL, NULL);
c19e6f0d612ee3 Chuck Lever   2022-12-14  679  
c19e6f0d612ee3 Chuck Lever   2022-12-14  680  		sg_init_table(desc.infrags, 4);
c19e6f0d612ee3 Chuck Lever   2022-12-14  681  		sg_init_table(desc.outfrags, 4);
c19e6f0d612ee3 Chuck Lever   2022-12-14  682  
c19e6f0d612ee3 Chuck Lever   2022-12-14  683  		err = xdr_process_buf(buf, offset, cbcbytes, encryptor, &desc);
c19e6f0d612ee3 Chuck Lever   2022-12-14  684  		skcipher_request_zero(req);
c19e6f0d612ee3 Chuck Lever   2022-12-14  685  		if (err)
c19e6f0d612ee3 Chuck Lever   2022-12-14  686  			return err;
c19e6f0d612ee3 Chuck Lever   2022-12-14  687  	}
c19e6f0d612ee3 Chuck Lever   2022-12-14  688  
c19e6f0d612ee3 Chuck Lever   2022-12-14  689  	/* Remaining plaintext is handled with CBC-CTS. */
c19e6f0d612ee3 Chuck Lever   2022-12-14  690  	err = gss_krb5_cts_crypt(cts_tfm, buf, offset + cbcbytes,
c19e6f0d612ee3 Chuck Lever   2022-12-14  691  				 desc.iv, pages, 1);
c19e6f0d612ee3 Chuck Lever   2022-12-14  692  	if (err)
c19e6f0d612ee3 Chuck Lever   2022-12-14  693  		return err;
c19e6f0d612ee3 Chuck Lever   2022-12-14  694  
c19e6f0d612ee3 Chuck Lever   2022-12-14  695  	return 0;
c19e6f0d612ee3 Chuck Lever   2022-12-14  696  }
c19e6f0d612ee3 Chuck Lever   2022-12-14  697  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
