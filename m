Content-Type: multipart/mixed; boundary="===============1078191343440467960=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ammarfaizi2-block:dhowells/linux-fs/rxrpc-ringless 4/9] net/rxrpc/call_event.c:258:14: warning: Value stored to 'hard_ack' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Thu, 07 Apr 2022 22:24:36 +0800
Message-ID: <202204072207.x7C35wpP-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1078191343440467960==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: "GNU/Weeb Mailing List" <gwml@vger.gnuweeb.org>
CC: linux-kernel(a)vger.kernel.org
TO: David Howells <dhowells@redhat.com>

tree:   https://github.com/ammarfaizi2/linux-block dhowells/linux-fs/rxrpc-=
ringless
head:   a4b855ffcf1d116e65df68fa6f5df04878bc0083
commit: 569092d7590362c7148ac768a923783886248c3b [4/9] rxrpc: Don't use a r=
ing buffer for call Tx queue
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20407/202204072207.x7C35wpP-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c4a1b0=
7d0979e7ff20d7d541af666d822d66b566)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/569092d7590362c=
7148ac768a923783886248c3b
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/lin=
ux-block
        git fetch --no-tags ammarfaizi2-block dhowells/linux-fs/rxrpc-ringl=
ess
        git checkout 569092d7590362c7148ac768a923783886248c3b
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                   memcpy(dev->broadcast, real_dev->broadcast, dev->addr_le=
n);
                   ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   net/8021q/vlan_dev.c:593:3: note: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11
                   memcpy(dev->broadcast, real_dev->broadcast, dev->addr_le=
n);
                   ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   Suppressed 74 warnings (74 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   71 warnings generated.
   Suppressed 71 warnings (71 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   71 warnings generated.
   Suppressed 71 warnings (71 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   108 warnings generated.
   Suppressed 108 warnings (108 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   80 warnings generated.
   Suppressed 80 warnings (80 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   91 warnings generated.
   net/rxrpc/output.c:578:2: warning: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&whdr, 0, sizeof(whdr));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   net/rxrpc/output.c:578:2: note: Call to function 'memset' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memset_s' in case of C11
           memset(&whdr, 0, sizeof(whdr));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   Suppressed 90 warnings (90 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   63 warnings generated.
   Suppressed 63 warnings (63 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   95 warnings generated.
   Suppressed 95 warnings (95 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   95 warnings generated.
   Suppressed 95 warnings (95 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   96 warnings generated.
   net/netfilter/nf_nat_amanda.c:65:2: warning: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           sprintf(buffer, "%u", port);
           ^~~~~~~
   net/netfilter/nf_nat_amanda.c:65:2: note: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11
           sprintf(buffer, "%u", port);
           ^~~~~~~
   Suppressed 95 warnings (95 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   38 warnings generated.
   Suppressed 38 warnings (38 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   90 warnings generated.
   Suppressed 90 warnings (90 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   91 warnings generated.
>> net/rxrpc/call_event.c:258:14: warning: Value stored to 'hard_ack' durin=
g its initialization is never read [clang-analyzer-deadcode.DeadStores]
           rxrpc_seq_t hard_ack =3D smp_load_acquire(&call->acks_hard_ack);
                       ^~~~~~~~
   net/rxrpc/call_event.c:258:14: note: Value stored to 'hard_ack' during i=
ts initialization is never read
           rxrpc_seq_t hard_ack =3D smp_load_acquire(&call->acks_hard_ack);
                       ^~~~~~~~
   Suppressed 90 warnings (90 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   90 warnings generated.
   Suppressed 90 warnings (89 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   85 warnings generated.
   Suppressed 85 warnings (85 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   48 warnings generated.
   Suppressed 48 warnings (48 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   81 warnings generated.
   net/mac80211/debugfs_sta.c:299:6: warning: Call to function 'sscanf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           if (sscanf(buf, "limit %u %u %u", &ac, &q_limit_l, &q_limit_h)
               ^~~~~~
   net/mac80211/debugfs_sta.c:299:6: note: Call to function 'sscanf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sscanf_s' in case of C11
           if (sscanf(buf, "limit %u %u %u", &ac, &q_limit_l, &q_limit_h)
               ^~~~~~
   net/mac80211/debugfs_sta.c:412:6: warning: Call to function 'sscanf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           if (sscanf(buf, "timeout=3D%d", &timeout) =3D=3D 1) {
               ^~~~~~
   net/mac80211/debugfs_sta.c:412:6: note: Call to function 'sscanf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sscanf_s' in case of C11
           if (sscanf(buf, "timeout=3D%d", &timeout) =3D=3D 1) {
               ^~~~~~
   net/mac80211/debugfs_sta.c:1033:2: warning: Call to function 'snprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(mac, sizeof(mac), "%pM", sta->sta.addr);
           ^~~~~~~~
   net/mac80211/debugfs_sta.c:1033:2: note: Call to function 'snprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'snprintf_s' in case of C11
           snprintf(mac, sizeof(mac), "%pM", sta->sta.addr);
           ^~~~~~~~
   Suppressed 78 warnings (78 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.

vim +/hard_ack +258 net/rxrpc/call_event.c

569092d7590362 net/rxrpc/call_event.c David Howells 2022-03-31  251  =

569092d7590362 net/rxrpc/call_event.c David Howells 2022-03-31  252  /*
569092d7590362 net/rxrpc/call_event.c David Howells 2022-03-31  253   * Shr=
ink the transmit queue.
2ad6691d988c0c net/rxrpc/call_event.c David Howells 2020-06-11  254   */
569092d7590362 net/rxrpc/call_event.c David Howells 2022-03-31  255  void r=
xrpc_shrink_call_tx_queue(struct rxrpc_call *call)
569092d7590362 net/rxrpc/call_event.c David Howells 2022-03-31  256  {
569092d7590362 net/rxrpc/call_event.c David Howells 2022-03-31  257  	struc=
t rxrpc_txbuf *txb;
569092d7590362 net/rxrpc/call_event.c David Howells 2022-03-31 @258  	rxrpc=
_seq_t hard_ack =3D smp_load_acquire(&call->acks_hard_ack);
2ad6691d988c0c net/rxrpc/call_event.c David Howells 2020-06-11  259  =

569092d7590362 net/rxrpc/call_event.c David Howells 2022-03-31  260  	_ente=
r("%x/%x/%x", call->tx_bottom, call->acks_hard_ack, call->tx_top);
2ad6691d988c0c net/rxrpc/call_event.c David Howells 2020-06-11  261  =

569092d7590362 net/rxrpc/call_event.c David Howells 2022-03-31  262  	for (=
;;) {
569092d7590362 net/rxrpc/call_event.c David Howells 2022-03-31  263  		spin=
_lock(&call->tx_lock);
569092d7590362 net/rxrpc/call_event.c David Howells 2022-03-31  264  		txb =
=3D list_first_entry_or_null(&call->tx_queue,
569092d7590362 net/rxrpc/call_event.c David Howells 2022-03-31  265  					 =
      struct rxrpc_txbuf, call_link);
569092d7590362 net/rxrpc/call_event.c David Howells 2022-03-31  266  		if (=
!txb)
569092d7590362 net/rxrpc/call_event.c David Howells 2022-03-31  267  			bre=
ak;
569092d7590362 net/rxrpc/call_event.c David Howells 2022-03-31  268  		hard=
_ack =3D smp_load_acquire(&call->acks_hard_ack);
569092d7590362 net/rxrpc/call_event.c David Howells 2022-03-31  269  		if (=
before(hard_ack, txb->hdr.seq))
569092d7590362 net/rxrpc/call_event.c David Howells 2022-03-31  270  			bre=
ak;
17926a79320afa net/rxrpc/ar-ack.c     David Howells 2007-04-26  271  =

569092d7590362 net/rxrpc/call_event.c David Howells 2022-03-31  272  		ASSE=
RTCMP(txb->hdr.seq, =3D=3D, call->tx_bottom + 1);
569092d7590362 net/rxrpc/call_event.c David Howells 2022-03-31  273  		call=
->tx_bottom++;
569092d7590362 net/rxrpc/call_event.c David Howells 2022-03-31  274  		list=
_del_rcu(&txb->call_link);
224711df5c00f7 net/rxrpc/ar-ack.c     David Howells 2007-05-04  275  =

569092d7590362 net/rxrpc/call_event.c David Howells 2022-03-31  276  		trac=
e_rxrpc_txqueue(call, rxrpc_txqueue_dequeue);
17926a79320afa net/rxrpc/ar-ack.c     David Howells 2007-04-26  277  =

569092d7590362 net/rxrpc/call_event.c David Howells 2022-03-31  278  		spin=
_unlock(&call->tx_lock);
569092d7590362 net/rxrpc/call_event.c David Howells 2022-03-31  279  =

569092d7590362 net/rxrpc/call_event.c David Howells 2022-03-31  280  		rxrp=
c_put_txbuf(txb, rxrpc_txbuf_put_rotated);
dfa7d9204054b0 net/rxrpc/call_event.c David Howells 2016-09-17  281  	}
17926a79320afa net/rxrpc/ar-ack.c     David Howells 2007-04-26  282  =

569092d7590362 net/rxrpc/call_event.c David Howells 2022-03-31  283  	spin_=
unlock(&call->tx_lock);
17926a79320afa net/rxrpc/ar-ack.c     David Howells 2007-04-26  284  }
17926a79320afa net/rxrpc/ar-ack.c     David Howells 2007-04-26  285  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1078191343440467960==--

