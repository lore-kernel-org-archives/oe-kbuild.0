Content-Type: multipart/mixed; boundary="===============1534460988942384440=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ammarfaizi2-block:dhowells/linux-fs/rxrpc-ringless 11/24] net/rxrpc/call_event.c:258:14: warning: Value stored to 'hard_ack' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Sun, 01 May 2022 16:02:20 +0800
Message-ID: <202205011555.lu9BTCHW-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1534460988942384440==
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
head:   14d1ef9d0da567ca88d30b4c79706079cc997e9f
commit: 87c13f9a6f1a63f389778a34c67060e7dd5c7209 [11/24] rxrpc: Don't use a=
 ring buffer for call Tx queue
:::::: branch date: 2 days ago
:::::: commit date: 9 days ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20501/202205011555.lu9BTCHW-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 400775=
649969b9baf3bc2a510266e7912bb16ae9)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/87c13f9a6f1a63f=
389778a34c67060e7dd5c7209
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/lin=
ux-block
        git fetch --no-tags ammarfaizi2-block dhowells/linux-fs/rxrpc-ringl=
ess
        git checkout 87c13f9a6f1a63f389778a34c67060e7dd5c7209
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                                   ^~~~~~~~~~~~~~~~
   fs/cifs/smb2inode.c:491:2: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
           memcpy(dst, src, (size_t)(&src->CurrentByteOffset) - (size_t)src=
);
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
   fs/cifs/smb2inode.c:605:2: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(data, smb2_data, sizeof(struct smb311_posix_qinfo));
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
   fs/cifs/smb2inode.c:605:2: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
           memcpy(data, smb2_data, sizeof(struct smb311_posix_qinfo));
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
   fs/cifs/smb2inode.c:634:2: warning: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&data, 0, sizeof(data));
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
   fs/cifs/smb2inode.c:634:2: note: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11
           memset(&data, 0, sizeof(data));
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
   Suppressed 76 warnings (76 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   fs/reiserfs/tail_conversion.c:157:3: warning: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(kaddr + pgoff, 0, blk_size - total_tail);
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
   fs/reiserfs/tail_conversion.c:157:3: note: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11
                   memset(kaddr + pgoff, 0, blk_size - total_tail);
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
   Suppressed 45 warnings (45 in non-user code).
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
   93 warnings generated.
   net/rxrpc/call_object.c:170:2: warning: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&call->sock_node, 0xed, sizeof(call->sock_node));
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
   net/rxrpc/call_object.c:170:2: note: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11
           memset(&call->sock_node, 0xed, sizeof(call->sock_node));
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
   net/rxrpc/call_object.c:569:3: warning: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&call->sock_node, 0xdd, sizeof(call->sock_node));
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
   net/rxrpc/call_object.c:569:3: note: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11
                   memset(&call->sock_node, 0xdd, sizeof(call->sock_node));
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
   net/rxrpc/call_object.c:688:2: warning: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&call->sock_node, 0xcd, sizeof(call->sock_node));
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
   net/rxrpc/call_object.c:688:2: note: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11
           memset(&call->sock_node, 0xcd, sizeof(call->sock_node));
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
   76 warnings generated.
   Suppressed 76 warnings (76 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   76 warnings generated.
   Suppressed 76 warnings (76 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   78 warnings generated.
   drivers/net/wireless/st/cw1200/cw1200_sdio.c:297:2: warning: Value store=
d to 'status' is never read [clang-analyzer-deadcode.DeadStores]
           status =3D cw1200_sdio_irq_subscribe(self);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/st/cw1200/cw1200_sdio.c:297:2: note: Value stored t=
o 'status' is never read
           status =3D cw1200_sdio_irq_subscribe(self);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 77 warnings (77 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   119 warnings generated.
   drivers/net/wireless/ti/wlcore/main.c:729:2: warning: Call to function '=
memset' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memset_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(data, 0, sizeof(*data));

vim +/hard_ack +258 net/rxrpc/call_event.c

87c13f9a6f1a63 net/rxrpc/call_event.c David Howells 2022-03-31  251  =

87c13f9a6f1a63 net/rxrpc/call_event.c David Howells 2022-03-31  252  /*
87c13f9a6f1a63 net/rxrpc/call_event.c David Howells 2022-03-31  253   * Shr=
ink the transmit queue.
2ad6691d988c0c net/rxrpc/call_event.c David Howells 2020-06-11  254   */
87c13f9a6f1a63 net/rxrpc/call_event.c David Howells 2022-03-31  255  void r=
xrpc_shrink_call_tx_queue(struct rxrpc_call *call)
87c13f9a6f1a63 net/rxrpc/call_event.c David Howells 2022-03-31  256  {
87c13f9a6f1a63 net/rxrpc/call_event.c David Howells 2022-03-31  257  	struc=
t rxrpc_txbuf *txb;
87c13f9a6f1a63 net/rxrpc/call_event.c David Howells 2022-03-31 @258  	rxrpc=
_seq_t hard_ack =3D smp_load_acquire(&call->acks_hard_ack);
2ad6691d988c0c net/rxrpc/call_event.c David Howells 2020-06-11  259  =

87c13f9a6f1a63 net/rxrpc/call_event.c David Howells 2022-03-31  260  	_ente=
r("%x/%x/%x", call->tx_bottom, call->acks_hard_ack, call->tx_top);
2ad6691d988c0c net/rxrpc/call_event.c David Howells 2020-06-11  261  =

87c13f9a6f1a63 net/rxrpc/call_event.c David Howells 2022-03-31  262  	for (=
;;) {
87c13f9a6f1a63 net/rxrpc/call_event.c David Howells 2022-03-31  263  		spin=
_lock(&call->tx_lock);
87c13f9a6f1a63 net/rxrpc/call_event.c David Howells 2022-03-31  264  		txb =
=3D list_first_entry_or_null(&call->tx_queue,
87c13f9a6f1a63 net/rxrpc/call_event.c David Howells 2022-03-31  265  					 =
      struct rxrpc_txbuf, call_link);
87c13f9a6f1a63 net/rxrpc/call_event.c David Howells 2022-03-31  266  		if (=
!txb)
87c13f9a6f1a63 net/rxrpc/call_event.c David Howells 2022-03-31  267  			bre=
ak;
87c13f9a6f1a63 net/rxrpc/call_event.c David Howells 2022-03-31  268  		hard=
_ack =3D smp_load_acquire(&call->acks_hard_ack);
87c13f9a6f1a63 net/rxrpc/call_event.c David Howells 2022-03-31  269  		if (=
before(hard_ack, txb->seq))
87c13f9a6f1a63 net/rxrpc/call_event.c David Howells 2022-03-31  270  			bre=
ak;
17926a79320afa net/rxrpc/ar-ack.c     David Howells 2007-04-26  271  =

87c13f9a6f1a63 net/rxrpc/call_event.c David Howells 2022-03-31  272  		ASSE=
RTCMP(txb->seq, =3D=3D, call->tx_bottom + 1);
87c13f9a6f1a63 net/rxrpc/call_event.c David Howells 2022-03-31  273  		call=
->tx_bottom++;
87c13f9a6f1a63 net/rxrpc/call_event.c David Howells 2022-03-31  274  		list=
_del_rcu(&txb->call_link);
224711df5c00f7 net/rxrpc/ar-ack.c     David Howells 2007-05-04  275  =

87c13f9a6f1a63 net/rxrpc/call_event.c David Howells 2022-03-31  276  		trac=
e_rxrpc_txqueue(call, rxrpc_txqueue_dequeue);
17926a79320afa net/rxrpc/ar-ack.c     David Howells 2007-04-26  277  =

87c13f9a6f1a63 net/rxrpc/call_event.c David Howells 2022-03-31  278  		spin=
_unlock(&call->tx_lock);
87c13f9a6f1a63 net/rxrpc/call_event.c David Howells 2022-03-31  279  =

87c13f9a6f1a63 net/rxrpc/call_event.c David Howells 2022-03-31  280  		rxrp=
c_put_txbuf(txb, rxrpc_txbuf_put_rotated);
dfa7d9204054b0 net/rxrpc/call_event.c David Howells 2016-09-17  281  	}
17926a79320afa net/rxrpc/ar-ack.c     David Howells 2007-04-26  282  =

87c13f9a6f1a63 net/rxrpc/call_event.c David Howells 2022-03-31  283  	spin_=
unlock(&call->tx_lock);
17926a79320afa net/rxrpc/ar-ack.c     David Howells 2007-04-26  284  }
17926a79320afa net/rxrpc/ar-ack.c     David Howells 2007-04-26  285  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1534460988942384440==--

