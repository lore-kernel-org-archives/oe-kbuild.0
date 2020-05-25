Content-Type: multipart/mixed; boundary="===============4510262801568883169=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: drivers/soc/fsl/dpio/qbman-portal.c:702:26: warning: Local variable 'd' shadows outer argument [shadowArgument]
Date: Tue, 26 May 2020 04:21:27 +0800
Message-ID: <202005260423.RiIh0laD%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4510262801568883169==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Youri Querry <youri.querry_1@nxp.com>
CC: Li Yang <leoyang.li@nxp.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   9cb1fd0efd195590b828b9b865421ad345a4a145
commit: 3b2abda7d28c69f564c1157b9b9c21ef40092ee9 soc: fsl: dpio: Replace QM=
AN array mode with ring mode enqueue
date:   3 months ago
:::::: branch date: 22 hours ago
:::::: commit date: 3 months ago
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=3D1 build):
        git checkout 3b2abda7d28c69f564c1157b9b9c21ef40092ee9
        # save the attached .config to linux build tree
        make W=3D1 ARCH=3Dx86_64 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> drivers/soc/fsl/dpio/qbman-portal.c:702:26: warning: Local variable 'd' =
shadows outer argument [shadowArgument]
      struct qbman_eq_desc *d =3D (struct qbman_eq_desc *)p;
                            ^
   drivers/soc/fsl/dpio/qbman-portal.c:652:39: note: Shadowed declaration
             const struct qbman_eq_desc *d,
                                         ^
   drivers/soc/fsl/dpio/qbman-portal.c:702:26: note: Shadow variable
      struct qbman_eq_desc *d =3D (struct qbman_eq_desc *)p;
                            ^
   drivers/soc/fsl/dpio/qbman-portal.c:785:26: warning: Local variable 'd' =
shadows outer argument [shadowArgument]
      struct qbman_eq_desc *d =3D (struct qbman_eq_desc *)p;
                            ^
   drivers/soc/fsl/dpio/qbman-portal.c:736:34: note: Shadowed declaration
        const struct qbman_eq_desc *d,
                                    ^
   drivers/soc/fsl/dpio/qbman-portal.c:785:26: note: Shadow variable
      struct qbman_eq_desc *d =3D (struct qbman_eq_desc *)p;
                            ^

# https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D3b2abda7d28c69f564c1157b9b9c21ef40092ee9
git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torval=
ds/linux.git
git remote update linus
git checkout 3b2abda7d28c69f564c1157b9b9c21ef40092ee9
vim +/d +702 drivers/soc/fsl/dpio/qbman-portal.c

321eecb06bfba0 drivers/staging/fsl-mc/bus/dpio/qbman-portal.c Roy Pledge   =
2017-03-13  638  =

9d98809711ae0e drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry =
2019-12-12  639  /**
b46fe745e4f610 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry =
2019-12-12  640   * qbman_swp_enqueue_multiple_direct() - Issue a multi enq=
ueue command
9d98809711ae0e drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry =
2019-12-12  641   * using one enqueue descriptor
9d98809711ae0e drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry =
2019-12-12  642   * @s:  the software portal used for enqueue
9d98809711ae0e drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry =
2019-12-12  643   * @d:  the enqueue descriptor
9d98809711ae0e drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry =
2019-12-12  644   * @fd: table pointer of frame descriptor table to be enqu=
eued
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry =
2019-12-12  645   * @flags: table pointer of QBMAN_ENQUEUE_FLAG_DCA flags, =
not used if NULL
9d98809711ae0e drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry =
2019-12-12  646   * @num_frames: number of fd to be enqueued
9d98809711ae0e drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry =
2019-12-12  647   *
9d98809711ae0e drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry =
2019-12-12  648   * Return the number of fd enqueued, or a negative error n=
umber.
9d98809711ae0e drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry =
2019-12-12  649   */
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry =
2019-12-12  650  static
b46fe745e4f610 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry =
2019-12-12  651  int qbman_swp_enqueue_multiple_direct(struct qbman_swp *s,
9d98809711ae0e drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry =
2019-12-12  652  				      const struct qbman_eq_desc *d,
9d98809711ae0e drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry =
2019-12-12  653  				      const struct dpaa2_fd *fd,
9d98809711ae0e drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry =
2019-12-12  654  				      uint32_t *flags,
9d98809711ae0e drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry =
2019-12-12  655  				      int num_frames)
9d98809711ae0e drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry =
2019-12-12  656  {
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry =
2019-12-12  657  	uint32_t *p =3D NULL;
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry =
2019-12-12  658  	const uint32_t *cl =3D (uint32_t *)d;
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry =
2019-12-12  659  	uint32_t eqcr_ci, eqcr_pi, half_mask, full_mask;
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry =
2019-12-12  660  	int i, num_enqueued =3D 0;
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry =
2019-12-12  661  	uint64_t addr_cena;
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry =
2019-12-12  662  =

3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry =
2019-12-12  663  	spin_lock(&s->access_spinlock);
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry =
2019-12-12  664  	half_mask =3D (s->eqcr.pi_ci_mask>>1);
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry =
2019-12-12  665  	full_mask =3D s->eqcr.pi_ci_mask;
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry =
2019-12-12  666  =

3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry =
2019-12-12  667  	if (!s->eqcr.available) {
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry =
2019-12-12  668  		eqcr_ci =3D s->eqcr.ci;
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry =
2019-12-12  669  		p =3D s->addr_cena + QBMAN_CENA_SWP_EQCR_CI;
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry =
2019-12-12  670  		s->eqcr.ci =3D qbman_read_register(s, QBMAN_CINH_SWP_EQC=
R_CI);
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry =
2019-12-12  671  =

3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry =
2019-12-12  672  		s->eqcr.available =3D qm_cyc_diff(s->eqcr.pi_ring_size,
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry =
2019-12-12  673  					eqcr_ci, s->eqcr.ci);
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry =
2019-12-12  674  		if (!s->eqcr.available) {
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry =
2019-12-12  675  			spin_unlock(&s->access_spinlock);
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry =
2019-12-12  676  			return 0;
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry =
2019-12-12  677  		}
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry =
2019-12-12  678  	}
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry =
2019-12-12  679  =

3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry =
2019-12-12  680  	eqcr_pi =3D s->eqcr.pi;
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry =
2019-12-12  681  	num_enqueued =3D (s->eqcr.available < num_frames) ?
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry =
2019-12-12  682  			s->eqcr.available : num_frames;
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry =
2019-12-12  683  	s->eqcr.available -=3D num_enqueued;
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry =
2019-12-12  684  	/* Fill in the EQCR ring */
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry =
2019-12-12  685  	for (i =3D 0; i < num_enqueued; i++) {
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry =
2019-12-12  686  		p =3D (s->addr_cena + QBMAN_CENA_SWP_EQCR(eqcr_pi & half=
_mask));
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry =
2019-12-12  687  		/* Skip copying the verb */
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry =
2019-12-12  688  		memcpy(&p[1], &cl[1], EQ_DESC_SIZE_WITHOUT_FD - 1);
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry =
2019-12-12  689  		memcpy(&p[EQ_DESC_SIZE_FD_START/sizeof(uint32_t)],
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry =
2019-12-12  690  		       &fd[i], sizeof(*fd));
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry =
2019-12-12  691  		eqcr_pi++;
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry =
2019-12-12  692  	}
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry =
2019-12-12  693  =

3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry =
2019-12-12  694  	dma_wmb();
9d98809711ae0e drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry =
2019-12-12  695  =

3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry =
2019-12-12  696  	/* Set the verb byte, have to substitute in the valid-bit=
 */
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry =
2019-12-12  697  	eqcr_pi =3D s->eqcr.pi;
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry =
2019-12-12  698  	for (i =3D 0; i < num_enqueued; i++) {
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry =
2019-12-12  699  		p =3D (s->addr_cena + QBMAN_CENA_SWP_EQCR(eqcr_pi & half=
_mask));
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry =
2019-12-12  700  		p[0] =3D cl[0] | s->eqcr.pi_vb;
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry =
2019-12-12  701  		if (flags && (flags[i] & QBMAN_ENQUEUE_FLAG_DCA)) {
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry =
2019-12-12 @702  			struct qbman_eq_desc *d =3D (struct qbman_eq_desc *)p;
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry =
2019-12-12  703  =

3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry =
2019-12-12  704  			d->dca =3D (1 << QB_ENQUEUE_CMD_DCA_EN_SHIFT) |
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry =
2019-12-12  705  				((flags[i]) & QBMAN_EQCR_DCA_IDXMASK);
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry =
2019-12-12  706  		}
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry =
2019-12-12  707  		eqcr_pi++;
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry =
2019-12-12  708  		if (!(eqcr_pi & half_mask))
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry =
2019-12-12  709  			s->eqcr.pi_vb ^=3D QB_VALID_BIT;
9d98809711ae0e drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry =
2019-12-12  710  	}
9d98809711ae0e drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry =
2019-12-12  711  =

3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry =
2019-12-12  712  	/* Flush all the cacheline without load/store in between =
*/
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry =
2019-12-12  713  	eqcr_pi =3D s->eqcr.pi;
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry =
2019-12-12  714  	addr_cena =3D (size_t)s->addr_cena;
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry =
2019-12-12  715  	for (i =3D 0; i < num_enqueued; i++)
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry =
2019-12-12  716  		eqcr_pi++;
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry =
2019-12-12  717  	s->eqcr.pi =3D eqcr_pi & full_mask;
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry =
2019-12-12  718  	spin_unlock(&s->access_spinlock);
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry =
2019-12-12  719  =

3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry =
2019-12-12  720  	return num_enqueued;
9d98809711ae0e drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry =
2019-12-12  721  }
9d98809711ae0e drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry =
2019-12-12  722  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4510262801568883169==--

