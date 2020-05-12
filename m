Content-Type: multipart/mixed; boundary="===============3757918525948675284=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: Re: [Intel-wired-lan] [PATCH S42 1/7] ice: Initialize Flow Director resources
Date: Wed, 13 May 2020 00:00:06 +0800
Message-ID: <202005122322.RpoZCF76%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3757918525948675284==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20200512010146.41303-1-anthony.l.nguyen@intel.com>
References: <20200512010146.41303-1-anthony.l.nguyen@intel.com>
TO: Tony Nguyen <anthony.l.nguyen@intel.com>
TO: intel-wired-lan(a)lists.osuosl.org

Hi Tony,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on jkirsher-next-queue/dev-queue]
[cannot apply to v5.7-rc5 next-20200512]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Tony-Nguyen/ice-Initialize=
-Flow-Director-resources/20200512-090738
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jkirsher/next-queue=
.git dev-queue
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-191-gc51a0382-dirty
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/net/ethernet/intel/ice/ice_flex_pipe.c:2826:44: sparse: sparse: =
non size-preserving pointer to integer cast
--
>> drivers/net/ethernet/intel/ice/ice_flow.c:832:20: sparse: sparse: non si=
ze-preserving pointer to integer cast
>> drivers/net/ethernet/intel/ice/ice_flow.c:860:17: sparse: sparse: non si=
ze-preserving integer to pointer cast

# https://github.com/0day-ci/linux/commit/f91f69a42e6af310d892b6f6d8dbf8874=
c845ba3
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout f91f69a42e6af310d892b6f6d8dbf8874c845ba3
vim +2826 drivers/net/ethernet/intel/ice/ice_flex_pipe.c

2c61054c5fdaf3 Tony Nguyen  2020-01-17  2810  =

2c61054c5fdaf3 Tony Nguyen  2020-01-17  2811  /**
2c61054c5fdaf3 Tony Nguyen  2020-01-17  2812   * ice_free_flow_profs - free=
 flow profile entries
2c61054c5fdaf3 Tony Nguyen  2020-01-17  2813   * @hw: pointer to the hardwa=
re structure
2c61054c5fdaf3 Tony Nguyen  2020-01-17  2814   * @blk_idx: HW block index
2c61054c5fdaf3 Tony Nguyen  2020-01-17  2815   */
2c61054c5fdaf3 Tony Nguyen  2020-01-17  2816  static void ice_free_flow_pro=
fs(struct ice_hw *hw, u8 blk_idx)
2c61054c5fdaf3 Tony Nguyen  2020-01-17  2817  {
2c61054c5fdaf3 Tony Nguyen  2020-01-17  2818  	struct ice_flow_prof *p, *tm=
p;
2c61054c5fdaf3 Tony Nguyen  2020-01-17  2819  =

2c61054c5fdaf3 Tony Nguyen  2020-01-17  2820  	mutex_lock(&hw->fl_profs_loc=
ks[blk_idx]);
2c61054c5fdaf3 Tony Nguyen  2020-01-17  2821  	list_for_each_entry_safe(p, =
tmp, &hw->fl_profs[blk_idx], l_entry) {
f91f69a42e6af3 Henry Tieman 2020-05-11  2822  		struct ice_flow_entry *e, *=
t;
f91f69a42e6af3 Henry Tieman 2020-05-11  2823  =

f91f69a42e6af3 Henry Tieman 2020-05-11  2824  		list_for_each_entry_safe(e,=
 t, &p->entries, l_entry)
f91f69a42e6af3 Henry Tieman 2020-05-11  2825  			ice_flow_rem_entry(hw, (en=
um ice_block)blk_idx,
f91f69a42e6af3 Henry Tieman 2020-05-11 @2826  					   ICE_FLOW_ENTRY_HNDL(e=
));
f91f69a42e6af3 Henry Tieman 2020-05-11  2827  =

2c61054c5fdaf3 Tony Nguyen  2020-01-17  2828  		list_del(&p->l_entry);
2c61054c5fdaf3 Tony Nguyen  2020-01-17  2829  		devm_kfree(ice_hw_to_dev(hw=
), p);
2c61054c5fdaf3 Tony Nguyen  2020-01-17  2830  	}
2c61054c5fdaf3 Tony Nguyen  2020-01-17  2831  	mutex_unlock(&hw->fl_profs_l=
ocks[blk_idx]);
2c61054c5fdaf3 Tony Nguyen  2020-01-17  2832  =

2c61054c5fdaf3 Tony Nguyen  2020-01-17  2833  	/* if driver is in reset and=
 tables are being cleared
2c61054c5fdaf3 Tony Nguyen  2020-01-17  2834  	 * re-initialize the flow pr=
ofile list heads
2c61054c5fdaf3 Tony Nguyen  2020-01-17  2835  	 */
2c61054c5fdaf3 Tony Nguyen  2020-01-17  2836  	INIT_LIST_HEAD(&hw->fl_profs=
[blk_idx]);
2c61054c5fdaf3 Tony Nguyen  2020-01-17  2837  }
2c61054c5fdaf3 Tony Nguyen  2020-01-17  2838  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3757918525948675284==--

