Content-Type: multipart/mixed; boundary="===============3794684195041513623=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: [linux-next:master 1074/9662] drivers/dma-buf/dma-fence-chain.c:65:23: sparse: sparse: non size-preserving integer to pointer cast
Date: Sat, 16 May 2020 09:41:47 +0800
Message-ID: <202005160943.VsRfcfWH%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3794684195041513623==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Chris Wilson <chris@chris-wilson.co.uk>
CC: Mika Kuoppala <mika.kuoppala@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   bdecf38f228bcca73b31ada98b5b7ba1215eb9c9
commit: 29da47cfc1f0c3aad0daa89ccf284c3465971482 [1074/9662] dma-buf: Prett=
ify typecasts for dma-fence-chain
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-193-gb8fad4bc-dirty
        git checkout 29da47cfc1f0c3aad0daa89ccf284c3465971482
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'
:::::: branch date: 13 hours ago
:::::: commit date: 5 weeks ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/dma-buf/dma-fence-chain.c:65:23: sparse: sparse: non size-preser=
ving integer to pointer cast

# https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commi=
t/?id=3D29da47cfc1f0c3aad0daa89ccf284c3465971482
git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/n=
ext/linux-next.git
git remote update linux-next
git checkout 29da47cfc1f0c3aad0daa89ccf284c3465971482
vim +65 drivers/dma-buf/dma-fence-chain.c

7bf60c52e093d9 Christian K=C3=B6nig 2019-04-01  30  =

7bf60c52e093d9 Christian K=C3=B6nig 2019-04-01  31  /**
7bf60c52e093d9 Christian K=C3=B6nig 2019-04-01  32   * dma_fence_chain_walk=
 - chain walking function
7bf60c52e093d9 Christian K=C3=B6nig 2019-04-01  33   * @fence: current chai=
n node
7bf60c52e093d9 Christian K=C3=B6nig 2019-04-01  34   *
7bf60c52e093d9 Christian K=C3=B6nig 2019-04-01  35   * Walk the chain to th=
e next node. Returns the next fence or NULL if we are at
7bf60c52e093d9 Christian K=C3=B6nig 2019-04-01  36   * the end of the chain=
. Garbage collects chain nodes which are already
7bf60c52e093d9 Christian K=C3=B6nig 2019-04-01  37   * signaled.
7bf60c52e093d9 Christian K=C3=B6nig 2019-04-01  38   */
7bf60c52e093d9 Christian K=C3=B6nig 2019-04-01  39  struct dma_fence *dma_f=
ence_chain_walk(struct dma_fence *fence)
7bf60c52e093d9 Christian K=C3=B6nig 2019-04-01  40  {
7bf60c52e093d9 Christian K=C3=B6nig 2019-04-01  41  	struct dma_fence_chain=
 *chain, *prev_chain;
7bf60c52e093d9 Christian K=C3=B6nig 2019-04-01  42  	struct dma_fence *prev=
, *replacement, *tmp;
7bf60c52e093d9 Christian K=C3=B6nig 2019-04-01  43  =

7bf60c52e093d9 Christian K=C3=B6nig 2019-04-01  44  	chain =3D to_dma_fence=
_chain(fence);
7bf60c52e093d9 Christian K=C3=B6nig 2019-04-01  45  	if (!chain) {
7bf60c52e093d9 Christian K=C3=B6nig 2019-04-01  46  		dma_fence_put(fence);
7bf60c52e093d9 Christian K=C3=B6nig 2019-04-01  47  		return NULL;
7bf60c52e093d9 Christian K=C3=B6nig 2019-04-01  48  	}
7bf60c52e093d9 Christian K=C3=B6nig 2019-04-01  49  =

7bf60c52e093d9 Christian K=C3=B6nig 2019-04-01  50  	while ((prev =3D dma_f=
ence_chain_get_prev(chain))) {
7bf60c52e093d9 Christian K=C3=B6nig 2019-04-01  51  =

7bf60c52e093d9 Christian K=C3=B6nig 2019-04-01  52  		prev_chain =3D to_dma=
_fence_chain(prev);
7bf60c52e093d9 Christian K=C3=B6nig 2019-04-01  53  		if (prev_chain) {
7bf60c52e093d9 Christian K=C3=B6nig 2019-04-01  54  			if (!dma_fence_is_si=
gnaled(prev_chain->fence))
7bf60c52e093d9 Christian K=C3=B6nig 2019-04-01  55  				break;
7bf60c52e093d9 Christian K=C3=B6nig 2019-04-01  56  =

7bf60c52e093d9 Christian K=C3=B6nig 2019-04-01  57  			replacement =3D dma_=
fence_chain_get_prev(prev_chain);
7bf60c52e093d9 Christian K=C3=B6nig 2019-04-01  58  		} else {
7bf60c52e093d9 Christian K=C3=B6nig 2019-04-01  59  			if (!dma_fence_is_si=
gnaled(prev))
7bf60c52e093d9 Christian K=C3=B6nig 2019-04-01  60  				break;
7bf60c52e093d9 Christian K=C3=B6nig 2019-04-01  61  =

7bf60c52e093d9 Christian K=C3=B6nig 2019-04-01  62  			replacement =3D NULL;
7bf60c52e093d9 Christian K=C3=B6nig 2019-04-01  63  		}
7bf60c52e093d9 Christian K=C3=B6nig 2019-04-01  64  =

29da47cfc1f0c3 Chris Wilson    2020-04-09 @65  		tmp =3D cmpxchg((struct dm=
a_fence __force **)&chain->prev,
29da47cfc1f0c3 Chris Wilson    2020-04-09  66  			      prev, replacement);
7bf60c52e093d9 Christian K=C3=B6nig 2019-04-01  67  		if (tmp =3D=3D prev)
7bf60c52e093d9 Christian K=C3=B6nig 2019-04-01  68  			dma_fence_put(tmp);
7bf60c52e093d9 Christian K=C3=B6nig 2019-04-01  69  		else
7bf60c52e093d9 Christian K=C3=B6nig 2019-04-01  70  			dma_fence_put(replac=
ement);
7bf60c52e093d9 Christian K=C3=B6nig 2019-04-01  71  		dma_fence_put(prev);
7bf60c52e093d9 Christian K=C3=B6nig 2019-04-01  72  	}
7bf60c52e093d9 Christian K=C3=B6nig 2019-04-01  73  =

7bf60c52e093d9 Christian K=C3=B6nig 2019-04-01  74  	dma_fence_put(fence);
7bf60c52e093d9 Christian K=C3=B6nig 2019-04-01  75  	return prev;
7bf60c52e093d9 Christian K=C3=B6nig 2019-04-01  76  }
7bf60c52e093d9 Christian K=C3=B6nig 2019-04-01  77  EXPORT_SYMBOL(dma_fence=
_chain_walk);
7bf60c52e093d9 Christian K=C3=B6nig 2019-04-01  78  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3794684195041513623==--

