Content-Type: multipart/mixed; boundary="===============2363296368102487512=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 567/3897] drivers/net/wireless/ath/wcn36xx/dxe.c:848:2: warning: Value stored to 'ctl_bd' is never read [clang-analyzer-deadcode.DeadStores]
Date: Mon, 29 Nov 2021 14:59:32 +0800
Message-ID: <202111291451.FrNoCDbG-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2363296368102487512==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Benjamin Li <benl@squareup.com>
CC: Kalle Valo <kvalo@codeaurora.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   f30a24ed97b401416118756fa35fbe5d28f999e3
commit: f02e1cc2a84693a649d94a7584291d88f31fd5fa [567/3897] wcn36xx: implem=
ent flush op to speed up connected scan
:::::: branch date: 3 days ago
:::::: commit date: 4 weeks ago
config: riscv-randconfig-c006-20211128 (https://download.01.org/0day-ci/arc=
hive/20211129/202111291451.FrNoCDbG-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 5c64d8=
ef8cc0c0ed3e0f2ae693d99e7f70f20a84)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3Df02e1cc2a84693a649d94a7584291d88f31fd5fa
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout f02e1cc2a84693a649d94a7584291d88f31fd5fa
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^~~~~~~~
   include/linux/bitops.h:189:10: note: Returning from 'fls'
                   return fls(l);
                          ^~~~~~
   include/linux/bitops.h:189:3: note: Returning the value 32
                   return fls(l);
                   ^~~~~~~~~~~~~
   include/linux/log2.h:57:16: note: Returning from 'fls_long'
           return 1UL << fls_long(n - 1);
                         ^~~~~~~~~~~~~~~
   include/linux/log2.h:57:13: note: The result of the left shift is undefi=
ned due to shifting by '32', which is greater or equal to the width of type=
 'unsigned long'
           return 1UL << fls_long(n - 1);
                      ^  ~~~~~~~~~~~~~~~
   include/linux/skbuff.h:2048:2: warning: 2nd function call argument is an=
 uninitialized value [clang-analyzer-core.CallAndMessage]
           __skb_insert(newsk, next->prev, next, list);
           ^
   drivers/net/wireless/ath/ath11k/ce.c:671:6: note: Assuming field 'send_c=
b' is null
           if (pipe->send_cb)
               ^~~~~~~~~~~~~
   drivers/net/wireless/ath/ath11k/ce.c:671:2: note: Taking false branch
           if (pipe->send_cb)
           ^
   drivers/net/wireless/ath/ath11k/ce.c:674:6: note: Assuming field 'recv_c=
b' is non-null
           if (pipe->recv_cb)
               ^~~~~~~~~~~~~
   drivers/net/wireless/ath/ath11k/ce.c:674:2: note: Taking true branch
           if (pipe->recv_cb)
           ^
   drivers/net/wireless/ath/ath11k/ce.c:675:3: note: Calling 'ath11k_ce_rec=
v_process_cb'
                   ath11k_ce_recv_process_cb(pipe);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath11k/ce.c:419:2: note: Calling '__skb_queue_h=
ead_init'
           __skb_queue_head_init(&list);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath11k/ce.c:419:2: note: Returning from '__skb_=
queue_head_init'
           __skb_queue_head_init(&list);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath11k/ce.c:420:2: note: Loop condition is true=
.  Entering loop body
           while (ath11k_ce_completed_recv_next(pipe, &skb, &nbytes) =3D=3D=
 0) {
           ^
   drivers/net/wireless/ath/ath11k/ce.c:425:16: note: Assuming 'max_nbytes'=
 is >=3D 'nbytes'
                   if (unlikely(max_nbytes < nbytes)) {
                                ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/net/wireless/ath/ath11k/ce.c:425:3: note: Taking false branch
                   if (unlikely(max_nbytes < nbytes)) {
                   ^
   drivers/net/wireless/ath/ath11k/ce.c:433:3: note: Calling '__skb_queue_t=
ail'
                   __skb_queue_tail(&list, skb);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/skbuff.h:2081:2: note: Calling '__skb_queue_before'
           __skb_queue_before(list, (struct sk_buff *)list, newsk);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/skbuff.h:2048:2: note: 2nd function call argument is an un=
initialized value
           __skb_insert(newsk, next->prev, next, list);
           ^                   ~~~~~~~~~~
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   sound/pci/ca0106/ca0106_mixer.c:704:2: warning: Call to function 'strcpy=
' is insecure as it does not provide bounding of the memory buffer. Replace=
 unbounded copy functions with analogous functions that support length argu=
ments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcp=
y]
           strcpy(id.name, name);
           ^~~~~~
   sound/pci/ca0106/ca0106_mixer.c:704:2: note: Call to function 'strcpy' i=
s insecure as it does not provide bounding of the memory buffer. Replace un=
bounded copy functions with analogous functions that support length argumen=
ts such as 'strlcpy'. CWE-119
           strcpy(id.name, name);
           ^~~~~~
   sound/pci/ca0106/ca0106_mixer.c:714:2: warning: Call to function 'strcpy=
' is insecure as it does not provide bounding of the memory buffer. Replace=
 unbounded copy functions with analogous functions that support length argu=
ments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcp=
y]
           strcpy(sid.name, name);
           ^~~~~~
   sound/pci/ca0106/ca0106_mixer.c:714:2: note: Call to function 'strcpy' i=
s insecure as it does not provide bounding of the memory buffer. Replace un=
bounded copy functions with analogous functions that support length argumen=
ts such as 'strlcpy'. CWE-119
           strcpy(sid.name, name);
           ^~~~~~
   sound/pci/ca0106/ca0106_mixer.c:723:3: warning: Call to function 'strcpy=
' is insecure as it does not provide bounding of the memory buffer. Replace=
 unbounded copy functions with analogous functions that support length argu=
ments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcp=
y]
                   strcpy(kctl->id.name, dst);
                   ^~~~~~
   sound/pci/ca0106/ca0106_mixer.c:723:3: note: Call to function 'strcpy' i=
s insecure as it does not provide bounding of the memory buffer. Replace un=
bounded copy functions with analogous functions that support length argumen=
ts such as 'strlcpy'. CWE-119
                   strcpy(kctl->id.name, dst);
                   ^~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   sound/pci/ca0106/ca_midi.c:290:2: warning: Call to function 'strcpy' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(rmidi->name, name);
           ^~~~~~
   sound/pci/ca0106/ca_midi.c:290:2: note: Call to function 'strcpy' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcpy'. CWE-119
           strcpy(rmidi->name, name);
           ^~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   sound/pci/lola/lola.c:632:2: warning: Call to function 'strcpy' is insec=
ure as it does not provide bounding of the memory buffer. Replace unbounded=
 copy functions with analogous functions that support length arguments such=
 as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(card->mixername, card->shortname);
           ^~~~~~
   sound/pci/lola/lola.c:632:2: note: Call to function 'strcpy' is insecure=
 as it does not provide bounding of the memory buffer. Replace unbounded co=
py functions with analogous functions that support length arguments such as=
 'strlcpy'. CWE-119
           strcpy(card->mixername, card->shortname);
           ^~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
>> drivers/net/wireless/ath/wcn36xx/dxe.c:848:2: warning: Value stored to '=
ctl_bd' is never read [clang-analyzer-deadcode.DeadStores]
           ctl_bd =3D ctl_bd_start;
           ^        ~~~~~~~~~~~~
   drivers/net/wireless/ath/wcn36xx/dxe.c:848:2: note: Value stored to 'ctl=
_bd' is never read
           ctl_bd =3D ctl_bd_start;
           ^        ~~~~~~~~~~~~
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   drivers/net/wireless/ath/ath5k/mac80211-ops.c:385:2: warning: Value stor=
ed to 'changed_flags' is never read [clang-analyzer-deadcode.DeadStores]
           changed_flags &=3D SUPPORTED_FIF_FLAGS;
           ^
   drivers/net/wireless/ath/ath5k/mac80211-ops.c:385:2: note: Value stored =
to 'changed_flags' is never read
   Suppressed 13 warnings (12 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   include/linux/list.h:71:12: warning: Access to field 'next' results in a=
 dereference of a null pointer (loaded from variable 'new') [clang-analyzer=
-core.NullDereference]
           new->next =3D next;
                     ^
   drivers/net/wireless/ath/ath9k/beacon.c:221:2: note: 'bf' initialized he=
re
           struct ath_buf *bf =3D avp->av_bcbuf;
           ^~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath9k/beacon.c:228:6: note: Assuming 'bf' is nu=
ll
           if (bf && bf->bf_mpdu) {
               ^~
   drivers/net/wireless/ath/ath9k/beacon.c:228:9: note: Left side of '&&' i=
s false
           if (bf && bf->bf_mpdu) {
                  ^
   drivers/net/wireless/ath/ath9k/beacon.c:239:16: note: Passing null point=
er value via 1st parameter 'new'
           list_add_tail(&bf->list, &sc->beacon.bbuf);
                         ^~~~~~~~~
   drivers/net/wireless/ath/ath9k/beacon.c:239:2: note: Calling 'list_add_t=
ail'
           list_add_tail(&bf->list, &sc->beacon.bbuf);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:100:13: note: Passing null pointer value via 1st pa=
rameter 'new'
           __list_add(new, head->prev, head);
                      ^~~
   include/linux/list.h:100:2: note: Calling '__list_add'
           __list_add(new, head->prev, head);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:67:6: note: Assuming the condition is false
           if (!__list_add_valid(new, prev, next))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:67:2: note: Taking false branch
           if (!__list_add_valid(new, prev, next))
           ^
   include/linux/list.h:71:12: note: Access to field 'next' results in a de=
reference of a null pointer (loaded from variable 'new')
           new->next =3D next;
           ~~~       ^
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   drivers/net/ethernet/qlogic/qed/qed_spq.c:345:4: warning: Value stored t=
o 'rc' is never read [clang-analyzer-deadcode.DeadStores]
                           rc =3D -EINVAL;
                           ^    ~~~~~~~
   drivers/net/ethernet/qlogic/qed/qed_spq.c:345:4: note: Value stored to '=
rc' is never read
                           rc =3D -EINVAL;
                           ^    ~~~~~~~
   drivers/net/ethernet/qlogic/qed/qed_spq.c:360:5: warning: Value stored t=
o 'rc' is never read [clang-analyzer-deadcode.DeadStores]

vim +/ctl_bd +848 drivers/net/wireless/ath/wcn36xx/dxe.c

8e84c25821698b Eugene Krasnikov 2013-10-08  836  =

f02e1cc2a84693 Benjamin Li      2021-10-27  837  static bool _wcn36xx_dxe_t=
x_channel_is_empty(struct wcn36xx_dxe_ch *ch)
f02e1cc2a84693 Benjamin Li      2021-10-27  838  {
f02e1cc2a84693 Benjamin Li      2021-10-27  839  	unsigned long flags;
f02e1cc2a84693 Benjamin Li      2021-10-27  840  	struct wcn36xx_dxe_ctl *c=
tl_bd_start, *ctl_skb_start;
f02e1cc2a84693 Benjamin Li      2021-10-27  841  	struct wcn36xx_dxe_ctl *c=
tl_bd, *ctl_skb;
f02e1cc2a84693 Benjamin Li      2021-10-27  842  	bool ret =3D true;
f02e1cc2a84693 Benjamin Li      2021-10-27  843  =

f02e1cc2a84693 Benjamin Li      2021-10-27  844  	spin_lock_irqsave(&ch->lo=
ck, flags);
f02e1cc2a84693 Benjamin Li      2021-10-27  845  =

f02e1cc2a84693 Benjamin Li      2021-10-27  846  	/* Loop through ring buff=
er looking for nonempty entries. */
f02e1cc2a84693 Benjamin Li      2021-10-27  847  	ctl_bd_start =3D ch->head=
_blk_ctl;
f02e1cc2a84693 Benjamin Li      2021-10-27 @848  	ctl_bd =3D ctl_bd_start;
f02e1cc2a84693 Benjamin Li      2021-10-27  849  	ctl_skb_start =3D ctl_bd_=
start->next;
f02e1cc2a84693 Benjamin Li      2021-10-27  850  	ctl_skb =3D ctl_skb_start;
f02e1cc2a84693 Benjamin Li      2021-10-27  851  	do {
f02e1cc2a84693 Benjamin Li      2021-10-27  852  		if (ctl_skb->skb) {
f02e1cc2a84693 Benjamin Li      2021-10-27  853  			ret =3D false;
f02e1cc2a84693 Benjamin Li      2021-10-27  854  			goto unlock;
f02e1cc2a84693 Benjamin Li      2021-10-27  855  		}
f02e1cc2a84693 Benjamin Li      2021-10-27  856  		ctl_bd =3D ctl_skb->next;
f02e1cc2a84693 Benjamin Li      2021-10-27  857  		ctl_skb =3D ctl_bd->next;
f02e1cc2a84693 Benjamin Li      2021-10-27  858  	} while (ctl_skb !=3D ctl=
_skb_start);
f02e1cc2a84693 Benjamin Li      2021-10-27  859  =

f02e1cc2a84693 Benjamin Li      2021-10-27  860  unlock:
f02e1cc2a84693 Benjamin Li      2021-10-27  861  	spin_unlock_irqrestore(&c=
h->lock, flags);
f02e1cc2a84693 Benjamin Li      2021-10-27  862  	return ret;
f02e1cc2a84693 Benjamin Li      2021-10-27  863  }
f02e1cc2a84693 Benjamin Li      2021-10-27  864  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2363296368102487512==--

