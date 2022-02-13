Content-Type: multipart/mixed; boundary="===============6471535479433138828=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH net-next 5/5] mctp: Add SIOCMCTP{ALLOC, DROP}TAG ioctls for tag control
Date: Sun, 13 Feb 2022 09:46:36 +0800
Message-ID: <202202130926.bzFbDbv2-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6471535479433138828==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220208094617.3675511-6-jk@codeconstruct.com.au>
References: <20220208094617.3675511-6-jk@codeconstruct.com.au>
TO: Jeremy Kerr <jk@codeconstruct.com.au>

Hi Jeremy,

I love your patch! Perhaps something to improve:

[auto build test WARNING on net-next/master]

url:    https://github.com/0day-ci/linux/commits/Jeremy-Kerr/MCTP-tag-contr=
ol-interface/20220208-195325
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git =
c3e676b98326a419f30dd5d956c68fc33323f4fd
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20213/202202130926.bzFbDbv2-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project e8bff9=
ae54a55b4dbfeb6ba55f723abbd81bf494)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/a1d553f399d7457bd3e455cd3=
f5e10dddb4bc2bf
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Jeremy-Kerr/MCTP-tag-control-inter=
face/20220208-195325
        git checkout a1d553f399d7457bd3e455cd3f5e10dddb4bc2bf
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mctp/route.c:335:2: note: Taking false branch
           if (skb->len < sizeof(struct mctp_hdr) + 1)
           ^
   net/mctp/route.c:342:6: note: Assuming field 'ver' is equal to 1
           if (mh->ver !=3D 1)
               ^~~~~~~~~~~~
   net/mctp/route.c:342:2: note: Taking false branch
           if (mh->ver !=3D 1)
           ^
   net/mctp/route.c:355:6: note: Assuming the condition is true
           if (flags & MCTP_HDR_FLAG_SOM) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~
   net/mctp/route.c:355:2: note: Taking true branch
           if (flags & MCTP_HDR_FLAG_SOM) {
           ^
   net/mctp/route.c:356:7: note: 'key' is null
                   if (key) {
                       ^~~
   net/mctp/route.c:356:3: note: Taking false branch
                   if (key) {
                   ^
   net/mctp/route.c:365:8: note: 'key' is null
                           if (key) {
                               ^~~
   net/mctp/route.c:365:4: note: Taking false branch
                           if (key) {
                           ^
   net/mctp/route.c:374:8: note: 'key' is null
                   if (!key && !msk && (tag & MCTP_HDR_FLAG_TO))
                        ^~~
   net/mctp/route.c:374:7: note: Left side of '&&' is true
                   if (!key && !msk && (tag & MCTP_HDR_FLAG_TO))
                       ^
   net/mctp/route.c:374:16: note: 'msk' is null
                   if (!key && !msk && (tag & MCTP_HDR_FLAG_TO))
                                ^~~
   net/mctp/route.c:374:7: note: Left side of '&&' is true
                   if (!key && !msk && (tag & MCTP_HDR_FLAG_TO))
                       ^
   net/mctp/route.c:374:24: note: Assuming the condition is true
                   if (!key && !msk && (tag & MCTP_HDR_FLAG_TO))
                                        ^~~~~~~~~~~~~~~~~~~~~~
   net/mctp/route.c:374:3: note: Taking true branch
                   if (!key && !msk && (tag & MCTP_HDR_FLAG_TO))
                   ^
   net/mctp/route.c:377:8: note: 'msk' is non-null
                   if (!msk) {
                        ^~~
   net/mctp/route.c:377:3: note: Taking false branch
                   if (!msk) {
                   ^
   net/mctp/route.c:385:7: note: Assuming the condition is false
                   if (flags & MCTP_HDR_FLAG_EOM) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~
   net/mctp/route.c:385:3: note: Taking false branch
                   if (flags & MCTP_HDR_FLAG_EOM) {
                   ^
   net/mctp/route.c:402:8: note: 'key' is null
                   if (!key) {
                        ^~~
   net/mctp/route.c:402:3: note: Taking true branch
                   if (!key) {
                   ^
   net/mctp/route.c:403:10: note: Calling 'mctp_key_alloc'
                           key =3D mctp_key_alloc(msk, mh->dest, mh->src,
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mctp/route.c:140:6: note: Assuming 'key' is non-null
           if (!key)
               ^~~~
   net/mctp/route.c:140:2: note: Taking false branch
           if (!key)
           ^
   net/mctp/route.c:148:2: note: Loop condition is false.  Exiting loop
           spin_lock_init(&key->lock);
           ^
   include/linux/spinlock.h:329:35: note: expanded from macro 'spin_lock_in=
it'
   # define spin_lock_init(lock)                                   \
                                                                   ^
   net/mctp/route.c:403:10: note: Returning from 'mctp_key_alloc'
                           key =3D mctp_key_alloc(msk, mh->dest, mh->src,
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mctp/route.c:405:9: note: 'key' is non-null
                           if (!key) {
                                ^~~
   net/mctp/route.c:405:4: note: Taking false branch
                           if (!key) {
                           ^
   net/mctp/route.c:422:8: note: Assuming 'rc' is not equal to 0
                           if (rc)
                               ^~
   net/mctp/route.c:422:4: note: Taking true branch
                           if (rc)
                           ^
   net/mctp/route.c:423:5: note: Memory is released
                                   kfree(key);
                                   ^~~~~~~~~~
   net/mctp/route.c:425:4: note: Use of memory after it is freed
                           trace_mctp_key_acquire(key);
                           ^                      ~~~
>> net/mctp/route.c:458:4: warning: Value stored to 'msk' is never read [cl=
ang-analyzer-deadcode.DeadStores]
                           msk =3D container_of(key->sk, struct mctp_sock, =
sk);
                           ^
   net/mctp/route.c:458:4: note: Value stored to 'msk' is never read
   Suppressed 11 warnings (10 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   drivers/mmc/host/wbsd.c:1289:4: warning: Value stored to 'id' is never r=
ead [clang-analyzer-deadcode.DeadStores]
                           id =3D 0xFFFF;
                           ^    ~~~~~~
   drivers/mmc/host/wbsd.c:1289:4: note: Value stored to 'id' is never read
                           id =3D 0xFFFF;
                           ^    ~~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/mmc/host/mtk-sd.c:680:2: warning: Value stored to 'sg' is never =
read [clang-analyzer-deadcode.DeadStores]
           sg =3D data->sg;
           ^    ~~~~~~~~
   drivers/mmc/host/mtk-sd.c:680:2: note: Value stored to 'sg' is never read
           sg =3D data->sg;
           ^    ~~~~~~~~
   drivers/mmc/host/mtk-sd.c:1054:2: warning: Value stored to 'read' is nev=
er read [clang-analyzer-deadcode.DeadStores]
           read =3D data->flags & MMC_DATA_READ;
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/mtk-sd.c:1054:2: note: Value stored to 'read' is never =
read
           read =3D data->flags & MMC_DATA_READ;
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   drivers/mmc/host/usdhi6rol0.c:397:26: warning: Access to field 'data' re=
sults in a dereference of a null pointer (loaded from field 'mrq') [clang-a=
nalyzer-core.NullDereference]
           struct mmc_data *data =3D host->mrq->data;
                                   ^
   drivers/mmc/host/usdhi6rol0.c:1686:26: note: Assuming 'mrq' is null
           struct mmc_data *data =3D mrq ? mrq->data : NULL;
                                   ^~~
   drivers/mmc/host/usdhi6rol0.c:1686:26: note: '?' condition is false
   drivers/mmc/host/usdhi6rol0.c:1689:2: note: Loop condition is false.  Ex=
iting loop
           dev_warn(mmc_dev(host->mmc),
           ^
   include/linux/dev_printk.h:146:2: note: expanded from macro 'dev_warn'
           dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt)=
, ##__VA_ARGS__)
           ^
   include/linux/dev_printk.h:109:3: note: expanded from macro 'dev_printk_=
index_wrap'
                   dev_printk_index_emit(level, fmt);                      \
                   ^
   include/linux/dev_printk.h:105:2: note: expanded from macro 'dev_printk_=
index_emit'
           printk_index_subsys_emit("%s %s: ", level, fmt)
           ^
   include/linux/printk.h:413:2: note: expanded from macro 'printk_index_su=
bsys_emit'
           __printk_index_emit(fmt, level, subsys_fmt_prefix)
           ^
   include/linux/printk.h:392:34: note: expanded from macro '__printk_index=
_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   drivers/mmc/host/usdhi6rol0.c:1691:4: note: Assuming field 'dma_active' =
is false
                    host->dma_active ? "DMA" : "PIO",
                    ^
   include/linux/dev_printk.h:146:70: note: expanded from macro 'dev_warn'
           dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt)=
, ##__VA_ARGS__)
                                                                           =
    ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk=
_index_wrap'
                   _p_func(dev, fmt, ##__VA_ARGS__);                       \
                                       ^~~~~~~~~~~
   drivers/mmc/host/usdhi6rol0.c:1691:4: note: '?' condition is false
                    host->dma_active ? "DMA" : "PIO",
                    ^
   drivers/mmc/host/usdhi6rol0.c:1692:16: note: 'mrq' is null
                    host->wait, mrq ? mrq->cmd->opcode : -1,
                                ^
   include/linux/dev_printk.h:146:70: note: expanded from macro 'dev_warn'
           dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt)=
, ##__VA_ARGS__)
                                                                           =
    ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk=
_index_wrap'
                   _p_func(dev, fmt, ##__VA_ARGS__);                       \
                                       ^~~~~~~~~~~
   drivers/mmc/host/usdhi6rol0.c:1692:16: note: '?' condition is false
                    host->wait, mrq ? mrq->cmd->opcode : -1,
                                ^
   drivers/mmc/host/usdhi6rol0.c:1693:4: note: Calling 'usdhi6_read'
                    usdhi6_read(host, USDHI6_SD_INFO1),
                    ^
   include/linux/dev_printk.h:146:70: note: expanded from macro 'dev_warn'
           dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt)=
, ##__VA_ARGS__)
                                                                           =
    ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk=
_index_wrap'
                   _p_func(dev, fmt, ##__VA_ARGS__);                       \
                                       ^~~~~~~~~~~
   drivers/mmc/host/usdhi6rol0.c:226:2: note: Taking false branch
           dev_vdbg(mmc_dev(host->mmc), "%s(0x%p + 0x%x) =3D 0x%x\n", __fun=
c__,
           ^

vim +/msk +458 net/mctp/route.c

4a992bbd365094 Jeremy Kerr   2021-07-29  315  =

889b7da23abf92 Jeremy Kerr   2021-07-29  316  static int mctp_route_input(s=
truct mctp_route *route, struct sk_buff *skb)
889b7da23abf92 Jeremy Kerr   2021-07-29  317  {
833ef3b91de692 Jeremy Kerr   2021-07-29  318  	struct net *net =3D dev_net(=
skb->dev);
833ef3b91de692 Jeremy Kerr   2021-07-29  319  	struct mctp_sk_key *key;
833ef3b91de692 Jeremy Kerr   2021-07-29  320  	struct mctp_sock *msk;
833ef3b91de692 Jeremy Kerr   2021-07-29  321  	struct mctp_hdr *mh;
4a992bbd365094 Jeremy Kerr   2021-07-29  322  	unsigned long f;
4a992bbd365094 Jeremy Kerr   2021-07-29  323  	u8 tag, flags;
4a992bbd365094 Jeremy Kerr   2021-07-29  324  	int rc;
833ef3b91de692 Jeremy Kerr   2021-07-29  325  =

833ef3b91de692 Jeremy Kerr   2021-07-29  326  	msk =3D NULL;
4a992bbd365094 Jeremy Kerr   2021-07-29  327  	rc =3D -EINVAL;
833ef3b91de692 Jeremy Kerr   2021-07-29  328  =

833ef3b91de692 Jeremy Kerr   2021-07-29  329  	/* we may be receiving a loc=
ally-routed packet; drop source sk
833ef3b91de692 Jeremy Kerr   2021-07-29  330  	 * accounting
833ef3b91de692 Jeremy Kerr   2021-07-29  331  	 */
833ef3b91de692 Jeremy Kerr   2021-07-29  332  	skb_orphan(skb);
833ef3b91de692 Jeremy Kerr   2021-07-29  333  =

833ef3b91de692 Jeremy Kerr   2021-07-29  334  	/* ensure we have enough dat=
a for a header and a type */
833ef3b91de692 Jeremy Kerr   2021-07-29  335  	if (skb->len < sizeof(struct=
 mctp_hdr) + 1)
4a992bbd365094 Jeremy Kerr   2021-07-29  336  		goto out;
833ef3b91de692 Jeremy Kerr   2021-07-29  337  =

833ef3b91de692 Jeremy Kerr   2021-07-29  338  	/* grab header, advance data=
 ptr */
833ef3b91de692 Jeremy Kerr   2021-07-29  339  	mh =3D mctp_hdr(skb);
833ef3b91de692 Jeremy Kerr   2021-07-29  340  	skb_pull(skb, sizeof(struct =
mctp_hdr));
833ef3b91de692 Jeremy Kerr   2021-07-29  341  =

833ef3b91de692 Jeremy Kerr   2021-07-29  342  	if (mh->ver !=3D 1)
4a992bbd365094 Jeremy Kerr   2021-07-29  343  		goto out;
833ef3b91de692 Jeremy Kerr   2021-07-29  344  =

4a992bbd365094 Jeremy Kerr   2021-07-29  345  	flags =3D mh->flags_seq_tag =
& (MCTP_HDR_FLAG_SOM | MCTP_HDR_FLAG_EOM);
4a992bbd365094 Jeremy Kerr   2021-07-29  346  	tag =3D mh->flags_seq_tag & =
(MCTP_HDR_TAG_MASK | MCTP_HDR_FLAG_TO);
833ef3b91de692 Jeremy Kerr   2021-07-29  347  =

833ef3b91de692 Jeremy Kerr   2021-07-29  348  	rcu_read_lock();
4a992bbd365094 Jeremy Kerr   2021-07-29  349  =

73c618456dc5cf Jeremy Kerr   2021-09-29  350  	/* lookup socket / reasm con=
text, exactly matching (src,dest,tag).
73c618456dc5cf Jeremy Kerr   2021-09-29  351  	 * we hold a ref on the key,=
 and key->lock held.
73c618456dc5cf Jeremy Kerr   2021-09-29  352  	 */
73c618456dc5cf Jeremy Kerr   2021-09-29  353  	key =3D mctp_lookup_key(net,=
 skb, mh->src, &f);
833ef3b91de692 Jeremy Kerr   2021-07-29  354  =

4a992bbd365094 Jeremy Kerr   2021-07-29  355  	if (flags & MCTP_HDR_FLAG_SO=
M) {
4a992bbd365094 Jeremy Kerr   2021-07-29  356  		if (key) {
4a992bbd365094 Jeremy Kerr   2021-07-29  357  			msk =3D container_of(key->=
sk, struct mctp_sock, sk);
4a992bbd365094 Jeremy Kerr   2021-07-29  358  		} else {
4a992bbd365094 Jeremy Kerr   2021-07-29  359  			/* first response to a bro=
adcast? do a more general
4a992bbd365094 Jeremy Kerr   2021-07-29  360  			 * key lookup to find the =
socket, but don't use this
4a992bbd365094 Jeremy Kerr   2021-07-29  361  			 * key for reassembly - we=
'll create a more specific
4a992bbd365094 Jeremy Kerr   2021-07-29  362  			 * one for future packets =
if required (ie, !EOM).
4a992bbd365094 Jeremy Kerr   2021-07-29  363  			 */
73c618456dc5cf Jeremy Kerr   2021-09-29  364  			key =3D mctp_lookup_key(ne=
t, skb, MCTP_ADDR_ANY, &f);
4a992bbd365094 Jeremy Kerr   2021-07-29  365  			if (key) {
4a992bbd365094 Jeremy Kerr   2021-07-29  366  				msk =3D container_of(key-=
>sk,
4a992bbd365094 Jeremy Kerr   2021-07-29  367  						   struct mctp_sock, sk=
);
73c618456dc5cf Jeremy Kerr   2021-09-29  368  				spin_unlock_irqrestore(&k=
ey->lock, f);
73c618456dc5cf Jeremy Kerr   2021-09-29  369  				mctp_key_unref(key);
4a992bbd365094 Jeremy Kerr   2021-07-29  370  				key =3D NULL;
4a992bbd365094 Jeremy Kerr   2021-07-29  371  			}
4a992bbd365094 Jeremy Kerr   2021-07-29  372  		}
833ef3b91de692 Jeremy Kerr   2021-07-29  373  =

4a992bbd365094 Jeremy Kerr   2021-07-29  374  		if (!key && !msk && (tag & =
MCTP_HDR_FLAG_TO))
833ef3b91de692 Jeremy Kerr   2021-07-29  375  			msk =3D mctp_lookup_bind(n=
et, skb);
833ef3b91de692 Jeremy Kerr   2021-07-29  376  =

4a992bbd365094 Jeremy Kerr   2021-07-29  377  		if (!msk) {
4a992bbd365094 Jeremy Kerr   2021-07-29  378  			rc =3D -ENOENT;
4a992bbd365094 Jeremy Kerr   2021-07-29  379  			goto out_unlock;
4a992bbd365094 Jeremy Kerr   2021-07-29  380  		}
833ef3b91de692 Jeremy Kerr   2021-07-29  381  =

4a992bbd365094 Jeremy Kerr   2021-07-29  382  		/* single-packet message? d=
eliver to socket, clean up any
4a992bbd365094 Jeremy Kerr   2021-07-29  383  		 * pending key.
4a992bbd365094 Jeremy Kerr   2021-07-29  384  		 */
4a992bbd365094 Jeremy Kerr   2021-07-29  385  		if (flags & MCTP_HDR_FLAG_E=
OM) {
833ef3b91de692 Jeremy Kerr   2021-07-29  386  			sock_queue_rcv_skb(&msk->s=
k, skb);
4a992bbd365094 Jeremy Kerr   2021-07-29  387  			if (key) {
4a992bbd365094 Jeremy Kerr   2021-07-29  388  				/* we've hit a pending re=
assembly; not much we
4a992bbd365094 Jeremy Kerr   2021-07-29  389  				 * can do but drop it
4a992bbd365094 Jeremy Kerr   2021-07-29  390  				 */
a1d553f399d745 Matt Johnston 2022-02-08  391  				__mctp_key_done_in(key, n=
et, f,
4f9e1ba6de45aa Jeremy Kerr   2021-09-29  392  						   MCTP_TRACE_KEY_REPLI=
ED);
73c618456dc5cf Jeremy Kerr   2021-09-29  393  				key =3D NULL;
4a992bbd365094 Jeremy Kerr   2021-07-29  394  			}
4a992bbd365094 Jeremy Kerr   2021-07-29  395  			rc =3D 0;
4a992bbd365094 Jeremy Kerr   2021-07-29  396  			goto out_unlock;
4a992bbd365094 Jeremy Kerr   2021-07-29  397  		}
833ef3b91de692 Jeremy Kerr   2021-07-29  398  =

4a992bbd365094 Jeremy Kerr   2021-07-29  399  		/* broadcast response or a =
bind() - create a key for further
4a992bbd365094 Jeremy Kerr   2021-07-29  400  		 * packets for this message
4a992bbd365094 Jeremy Kerr   2021-07-29  401  		 */
4a992bbd365094 Jeremy Kerr   2021-07-29  402  		if (!key) {
4a992bbd365094 Jeremy Kerr   2021-07-29  403  			key =3D mctp_key_alloc(msk=
, mh->dest, mh->src,
4a992bbd365094 Jeremy Kerr   2021-07-29  404  					     tag, GFP_ATOMIC);
4a992bbd365094 Jeremy Kerr   2021-07-29  405  			if (!key) {
4a992bbd365094 Jeremy Kerr   2021-07-29  406  				rc =3D -ENOMEM;
4a992bbd365094 Jeremy Kerr   2021-07-29  407  				goto out_unlock;
4a992bbd365094 Jeremy Kerr   2021-07-29  408  			}
833ef3b91de692 Jeremy Kerr   2021-07-29  409  =

73c618456dc5cf Jeremy Kerr   2021-09-29  410  			/* we can queue without th=
e key lock here, as the
4a992bbd365094 Jeremy Kerr   2021-07-29  411  			 * key isn't observable yet
4a992bbd365094 Jeremy Kerr   2021-07-29  412  			 */
4a992bbd365094 Jeremy Kerr   2021-07-29  413  			mctp_frag_queue(key, skb);
4a992bbd365094 Jeremy Kerr   2021-07-29  414  =

4a992bbd365094 Jeremy Kerr   2021-07-29  415  			/* if the key_add fails, w=
e've raced with another
4a992bbd365094 Jeremy Kerr   2021-07-29  416  			 * SOM packet with the sam=
e src, dest and tag. There's
4a992bbd365094 Jeremy Kerr   2021-07-29  417  			 * no way to distinguish f=
uture packets, so all we
4a992bbd365094 Jeremy Kerr   2021-07-29  418  			 * can do is drop; we'll f=
ree the skb on exit from
4a992bbd365094 Jeremy Kerr   2021-07-29  419  			 * this function.
4a992bbd365094 Jeremy Kerr   2021-07-29  420  			 */
4a992bbd365094 Jeremy Kerr   2021-07-29  421  			rc =3D mctp_key_add(key, m=
sk);
4a992bbd365094 Jeremy Kerr   2021-07-29  422  			if (rc)
4a992bbd365094 Jeremy Kerr   2021-07-29  423  				kfree(key);
4a992bbd365094 Jeremy Kerr   2021-07-29  424  =

4f9e1ba6de45aa Jeremy Kerr   2021-09-29  425  			trace_mctp_key_acquire(key=
);
4f9e1ba6de45aa Jeremy Kerr   2021-09-29  426  =

73c618456dc5cf Jeremy Kerr   2021-09-29  427  			/* we don't need to releas=
e key->lock on exit */
0b93aed2842d95 Matt Johnston 2021-10-14  428  			mctp_key_unref(key);
73c618456dc5cf Jeremy Kerr   2021-09-29  429  			key =3D NULL;
4a992bbd365094 Jeremy Kerr   2021-07-29  430  =

73c618456dc5cf Jeremy Kerr   2021-09-29  431  		} else {
4a992bbd365094 Jeremy Kerr   2021-07-29  432  			if (key->reasm_head || key=
->reasm_dead) {
4a992bbd365094 Jeremy Kerr   2021-07-29  433  				/* duplicate start? drop =
everything */
a1d553f399d745 Matt Johnston 2022-02-08  434  				__mctp_key_done_in(key, n=
et, f,
4f9e1ba6de45aa Jeremy Kerr   2021-09-29  435  						   MCTP_TRACE_KEY_INVAL=
IDATED);
4a992bbd365094 Jeremy Kerr   2021-07-29  436  				rc =3D -EEXIST;
73c618456dc5cf Jeremy Kerr   2021-09-29  437  				key =3D NULL;
4a992bbd365094 Jeremy Kerr   2021-07-29  438  			} else {
4a992bbd365094 Jeremy Kerr   2021-07-29  439  				rc =3D mctp_frag_queue(ke=
y, skb);
4a992bbd365094 Jeremy Kerr   2021-07-29  440  			}
4a992bbd365094 Jeremy Kerr   2021-07-29  441  		}
4a992bbd365094 Jeremy Kerr   2021-07-29  442  =

4a992bbd365094 Jeremy Kerr   2021-07-29  443  	} else if (key) {
4a992bbd365094 Jeremy Kerr   2021-07-29  444  		/* this packet continues a =
previous message; reassemble
4a992bbd365094 Jeremy Kerr   2021-07-29  445  		 * using the message-specif=
ic key
4a992bbd365094 Jeremy Kerr   2021-07-29  446  		 */
4a992bbd365094 Jeremy Kerr   2021-07-29  447  =

4a992bbd365094 Jeremy Kerr   2021-07-29  448  		/* we need to be continuing=
 an existing reassembly... */
4a992bbd365094 Jeremy Kerr   2021-07-29  449  		if (!key->reasm_head)
4a992bbd365094 Jeremy Kerr   2021-07-29  450  			rc =3D -EINVAL;
4a992bbd365094 Jeremy Kerr   2021-07-29  451  		else
4a992bbd365094 Jeremy Kerr   2021-07-29  452  			rc =3D mctp_frag_queue(key=
, skb);
4a992bbd365094 Jeremy Kerr   2021-07-29  453  =

4a992bbd365094 Jeremy Kerr   2021-07-29  454  		/* end of message? deliver =
to socket, and we're done with
4a992bbd365094 Jeremy Kerr   2021-07-29  455  		 * the reassembly/response =
key
4a992bbd365094 Jeremy Kerr   2021-07-29  456  		 */
4a992bbd365094 Jeremy Kerr   2021-07-29  457  		if (!rc && flags & MCTP_HDR=
_FLAG_EOM) {
a1d553f399d745 Matt Johnston 2022-02-08 @458  			msk =3D container_of(key->=
sk, struct mctp_sock, sk);
4a992bbd365094 Jeremy Kerr   2021-07-29  459  			sock_queue_rcv_skb(key->sk=
, key->reasm_head);
4a992bbd365094 Jeremy Kerr   2021-07-29  460  			key->reasm_head =3D NULL;
a1d553f399d745 Matt Johnston 2022-02-08  461  			__mctp_key_done_in(key, ne=
t, f, MCTP_TRACE_KEY_REPLIED);
73c618456dc5cf Jeremy Kerr   2021-09-29  462  			key =3D NULL;
4a992bbd365094 Jeremy Kerr   2021-07-29  463  		}
4a992bbd365094 Jeremy Kerr   2021-07-29  464  =

4a992bbd365094 Jeremy Kerr   2021-07-29  465  	} else {
4a992bbd365094 Jeremy Kerr   2021-07-29  466  		/* not a start, no matching=
 key */
4a992bbd365094 Jeremy Kerr   2021-07-29  467  		rc =3D -ENOENT;
4a992bbd365094 Jeremy Kerr   2021-07-29  468  	}
4a992bbd365094 Jeremy Kerr   2021-07-29  469  =

4a992bbd365094 Jeremy Kerr   2021-07-29  470  out_unlock:
833ef3b91de692 Jeremy Kerr   2021-07-29  471  	rcu_read_unlock();
73c618456dc5cf Jeremy Kerr   2021-09-29  472  	if (key) {
73c618456dc5cf Jeremy Kerr   2021-09-29  473  		spin_unlock_irqrestore(&key=
->lock, f);
73c618456dc5cf Jeremy Kerr   2021-09-29  474  		mctp_key_unref(key);
73c618456dc5cf Jeremy Kerr   2021-09-29  475  	}
4a992bbd365094 Jeremy Kerr   2021-07-29  476  out:
4a992bbd365094 Jeremy Kerr   2021-07-29  477  	if (rc)
889b7da23abf92 Jeremy Kerr   2021-07-29  478  		kfree_skb(skb);
4a992bbd365094 Jeremy Kerr   2021-07-29  479  	return rc;
4a992bbd365094 Jeremy Kerr   2021-07-29  480  }
4a992bbd365094 Jeremy Kerr   2021-07-29  481  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6471535479433138828==--

