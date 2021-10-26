Content-Type: multipart/mixed; boundary="===============8361110254624543336=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [Intel-gfx] [PATCH 1/2] dma-buf: Fix dma_resv_wait_timeout handling of timeout = 0.
Date: Tue, 26 Oct 2021 13:32:36 +0800
Message-ID: <202110261359.iixnCPik-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8361110254624543336==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20211015115720.79958-2-maarten.lankhorst@linux.intel.com>
References: <20211015115720.79958-2-maarten.lankhorst@linux.intel.com>
TO: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
TO: dri-devel(a)lists.freedesktop.org
CC: intel-gfx(a)lists.freedesktop.org
CC: linux-media(a)vger.kernel.org
CC: linaro-mm-sig(a)lists.linaro.org
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
CC: "Christian K=C3=B6nig" <christian.koenig@amd.com>
CC: Daniel Vetter <daniel.vetter@ffwll.ch>

Hi Maarten,

I love your patch! Perhaps something to improve:

[auto build test WARNING on linux-next/master]
[cannot apply to tegra-drm/drm/tegra/for-next linus/master v5.15-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Maarten-Lankhorst/dma-buf-=
Fix-breakages-from-dma_resv_iter-conversion/20211015-195930
base:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 8006b911c90a4ec09958447d24c8a4c3538f5723
:::::: branch date: 11 days ago
:::::: commit date: 11 days ago
compiler: s390-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/dma-buf/dma-resv.c:631:4: warning: Assignment of function parame=
ter has no effect outside the function. [uselessAssignmentArg]
      timeout =3D ret;
      ^

vim +631 drivers/dma-buf/dma-resv.c

3c3b177a9369b2 drivers/dma-buf/reservation.c Maarten Lankhorst 2014-07-01  =
602  =

dad6c3945fd253 drivers/dma-buf/reservation.c Rob Clark         2016-03-31  =
603  /**
d3fae3b3daac09 drivers/dma-buf/dma-resv.c    Christian K=C3=B6nig   2021-06=
-02  604   * dma_resv_wait_timeout - Wait on reservation's objects
dad6c3945fd253 drivers/dma-buf/reservation.c Rob Clark         2016-03-31  =
605   * shared and/or exclusive fences.
dad6c3945fd253 drivers/dma-buf/reservation.c Rob Clark         2016-03-31  =
606   * @obj: the reservation object
dad6c3945fd253 drivers/dma-buf/reservation.c Rob Clark         2016-03-31  =
607   * @wait_all: if true, wait on all fences, else wait on just exclusive=
 fence
dad6c3945fd253 drivers/dma-buf/reservation.c Rob Clark         2016-03-31  =
608   * @intr: if true, do interruptible wait
dad6c3945fd253 drivers/dma-buf/reservation.c Rob Clark         2016-03-31  =
609   * @timeout: timeout value in jiffies or zero to return immediately
dad6c3945fd253 drivers/dma-buf/reservation.c Rob Clark         2016-03-31  =
610   *
d3fae3b3daac09 drivers/dma-buf/dma-resv.c    Christian K=C3=B6nig   2021-06=
-02  611   * Callers are not required to hold specific locks, but maybe hold
d3fae3b3daac09 drivers/dma-buf/dma-resv.c    Christian K=C3=B6nig   2021-06=
-02  612   * dma_resv_lock() already
dad6c3945fd253 drivers/dma-buf/reservation.c Rob Clark         2016-03-31  =
613   * RETURNS
dad6c3945fd253 drivers/dma-buf/reservation.c Rob Clark         2016-03-31  =
614   * Returns -ERESTARTSYS if interrupted, 0 if the wait timed out, or
dad6c3945fd253 drivers/dma-buf/reservation.c Rob Clark         2016-03-31  =
615   * greater than zer on success.
dad6c3945fd253 drivers/dma-buf/reservation.c Rob Clark         2016-03-31  =
616   */
d3fae3b3daac09 drivers/dma-buf/dma-resv.c    Christian K=C3=B6nig   2021-06=
-02  617  long dma_resv_wait_timeout(struct dma_resv *obj, bool wait_all, b=
ool intr,
3c3b177a9369b2 drivers/dma-buf/reservation.c Maarten Lankhorst 2014-07-01  =
618  			   unsigned long timeout)
3c3b177a9369b2 drivers/dma-buf/reservation.c Maarten Lankhorst 2014-07-01  =
619  {
172266743bb5c3 drivers/dma-buf/dma-resv.c    Maarten Lankhorst 2021-10-15  =
620  	long ret =3D timeout ?: 1;
ada5c48b11a3df drivers/dma-buf/dma-resv.c    Christian K=C3=B6nig   2021-06=
-15  621  	struct dma_resv_iter cursor;
068d9d754bc15f drivers/dma-buf/dma-resv.c    Christian K=C3=B6nig   2021-05=
-11  622  	struct dma_fence *fence;
3c3b177a9369b2 drivers/dma-buf/reservation.c Maarten Lankhorst 2014-07-01  =
623  =

ada5c48b11a3df drivers/dma-buf/dma-resv.c    Christian K=C3=B6nig   2021-06=
-15  624  	dma_resv_iter_begin(&cursor, obj, wait_all);
ada5c48b11a3df drivers/dma-buf/dma-resv.c    Christian K=C3=B6nig   2021-06=
-15  625  	dma_resv_for_each_fence_unlocked(&cursor, fence) {
172266743bb5c3 drivers/dma-buf/dma-resv.c    Maarten Lankhorst 2021-10-15  =
626  		ret =3D dma_fence_wait_timeout(fence, intr, timeout);
172266743bb5c3 drivers/dma-buf/dma-resv.c    Maarten Lankhorst 2021-10-15  =
627  		if (ret <=3D 0)
172266743bb5c3 drivers/dma-buf/dma-resv.c    Maarten Lankhorst 2021-10-15  =
628  			break;
3c3b177a9369b2 drivers/dma-buf/reservation.c Maarten Lankhorst 2014-07-01  =
629  =

172266743bb5c3 drivers/dma-buf/dma-resv.c    Maarten Lankhorst 2021-10-15  =
630  		if (timeout)
172266743bb5c3 drivers/dma-buf/dma-resv.c    Maarten Lankhorst 2021-10-15 @=
631  			timeout =3D ret;
b016cd6ed4b772 drivers/dma-buf/dma-resv.c    Chris Wilson      2019-08-14  =
632  	}
ada5c48b11a3df drivers/dma-buf/dma-resv.c    Christian K=C3=B6nig   2021-06=
-15  633  	dma_resv_iter_end(&cursor);
b016cd6ed4b772 drivers/dma-buf/dma-resv.c    Chris Wilson      2019-08-14  =
634  =

3c3b177a9369b2 drivers/dma-buf/reservation.c Maarten Lankhorst 2014-07-01  =
635  	return ret;
3c3b177a9369b2 drivers/dma-buf/reservation.c Maarten Lankhorst 2014-07-01  =
636  }
d3fae3b3daac09 drivers/dma-buf/dma-resv.c    Christian K=C3=B6nig   2021-06=
-02  637  EXPORT_SYMBOL_GPL(dma_resv_wait_timeout);
3c3b177a9369b2 drivers/dma-buf/reservation.c Maarten Lankhorst 2014-07-01  =
638  =

3c3b177a9369b2 drivers/dma-buf/reservation.c Maarten Lankhorst 2014-07-01  =
639  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============8361110254624543336==--

