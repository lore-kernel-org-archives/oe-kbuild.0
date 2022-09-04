Content-Type: multipart/mixed; boundary="===============8021915165011154059=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [RESEND PATCH v5 6/7] dmaengine: hisilicon: Dump regs to debugfs
Date: Sun, 04 Sep 2022 21:30:33 +0800
Message-ID: <202209042131.G0KO4txt-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8021915165011154059==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: drivers/d=
ma/hisi_dma.c:879:13: warning: use of uninitialized value '<unknown>' [CWE-=
457] [-Wanalyzer-use-of-uninitialized-value]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220830062251.52993-7-haijie1@huawei.com>
References: <20220830062251.52993-7-haijie1@huawei.com>
TO: Jie Hai <haijie1@huawei.com>
TO: vkoul(a)kernel.org
TO: wangzhou1(a)hisilicon.com
CC: dmaengine(a)vger.kernel.org
CC: linux-kernel(a)vger.kernel.org

Hi Jie,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.0-rc3 next-20220901]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jie-Hai/dmaengine-hi=
silicon-Add-support-for-hisi-dma-driver/20220830-142733
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
dcf8e5633e2e69ad60b730ab5905608b756a032f
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: arm-randconfig-c002-20220904 (https://download.01.org/0day-ci/archi=
ve/20220904/202209042131.G0KO4txt-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/f98ffff8b8aae8e618b=
6c03a39dc7f85578c0360
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jie-Hai/dmaengine-hisilicon-Add-su=
pport-for-hisi-dma-driver/20220830-142733
        git checkout f98ffff8b8aae8e618b6c03a39dc7f85578c0360
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc_analyzer warnings: (new ones prefixed by >>)
                     |      |         |
                     |      |         (15) ...to here
                     |
                   'vchan_get_all_descriptors': event 16
                     |
                     |include/linux/list.h:507:12:
                     |  507 |         if (!list_empty(list)) {
                     |      |            ^
                     |      |            |
                     |      |            (16) following 'false' branch...
                     |
                   'vchan_get_all_descriptors': event 17
                     |
                     |drivers/dma/virt-dma.h:183:9:
                     |  183 |         list_splice_tail_init(&vc->desc_compl=
eted, head);
                     |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~
                     |      |         |
                     |      |         (17) ...to here
                     |
                   'vchan_get_all_descriptors': event 18
                     |
                     |include/linux/list.h:507:12:
                     |  507 |         if (!list_empty(list)) {
                     |      |            ^
                     |      |            |
                     |      |            (18) following 'false' branch...
                     |
                   'vchan_get_all_descriptors': event 19
                     |
                     |drivers/dma/virt-dma.h:184:9:
                     |  184 |         list_splice_tail_init(&vc->desc_termi=
nated, head);
                     |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~
                     |      |         |
                     |      |         (19) ...to here
                     |
                   'vchan_get_all_descriptors': event 20
                     |
                     |include/linux/list.h:507:12:
                     |  507 |         if (!list_empty(list)) {
                     |      |            ^
                     |      |            |
                     |      |            (20) following 'false' branch...
                     |
                   'vchan_get_all_descriptors': event 21
                     |
                     |drivers/dma/virt-dma.h:185:1:
                     |  185 | }
                     |      | ^
                     |      | |
                     |      | (21) ...to here
                     |
              <------+
              |
            'vchan_free_chan_resources': event 22
              |
              |  194 |         vchan_get_all_descriptors(vc, &head);
              |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |         |
              |      |         (22) returning to 'vchan_free_chan_resources=
' from 'vchan_get_all_descriptors'
              |
            'vchan_free_chan_resources': event 23
              |
              |include/linux/list.h:675:14:
              |  675 |              !list_entry_is_head(pos, head, member);=
                    \
              |      |              ^
              |      |              |
              |      |              (23) following 'true' branch...
   drivers/dma/virt-dma.h:195:9: note: in expansion of macro 'list_for_each=
_entry'
              |  195 |         list_for_each_entry(vd, &head, node)
              |      |         ^~~~~~~~~~~~~~~~~~~
              |
            'vchan_free_chan_resources': event 24
              |
              |include/linux/dmaengine.h:1555:11:
              | 1555 |         tx->flags &=3D ~DMA_CTRL_REUSE;
              |      |         ~~^~~~~~~
              |      |           |
              |      |           (24) ...to here
              |
            'vchan_free_chan_resources': event 25
              |
              |include/linux/container_of.h:18:15:
              |   18 |         void *__mptr =3D (void *)(ptr);             =
                      \
              |      |               ^~~~~~
              |      |               |
              |      |               (25) use of uninitialized value '*vd.n=
ode.next' here
   include/linux/list.h:520:9: note: in expansion of macro 'container_of'
              |  520 |         container_of(ptr, type, member)
              |      |         ^~~~~~~~~~~~
   include/linux/list.h:564:9: note: in expansion of macro 'list_entry'
              |  564 |         list_entry((pos)->member.next, typeof(*(pos)=
), member)
              |      |         ^~~~~~~~~~
   include/linux/list.h:676:20: note: in expansion of macro 'list_next_entr=
y'
              |  676 |              pos =3D list_next_entry(pos, member))
              |      |                    ^~~~~~~~~~~~~~~
   drivers/dma/virt-dma.h:195:9: note: in expansion of macro 'list_for_each=
_entry'
              |  195 |         list_for_each_entry(vd, &head, node)
              |      |         ^~~~~~~~~~~~~~~~~~~
              |
   drivers/dma/hisi_dma.c: In function 'hisi_dma_create_chan_dir':
>> drivers/dma/hisi_dma.c:879:13: warning: use of uninitialized value '<unk=
nown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     879 |         u32 regs_sz;
         |             ^~~~~~~
     'hisi_dma_create_chan_dir': event 1
       |
       |  879 |         u32 regs_sz;
       |      |             ^~~~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
       |

vim +879 drivers/dma/hisi_dma.c

f98ffff8b8aae8 Jie Hai 2022-08-30  871  =

f98ffff8b8aae8 Jie Hai 2022-08-30  872  static int hisi_dma_create_chan_dir=
(struct hisi_dma_dev *hdma_dev)
f98ffff8b8aae8 Jie Hai 2022-08-30  873  {
f98ffff8b8aae8 Jie Hai 2022-08-30  874  	char dir_name[HISI_DMA_MAX_DIR_NAM=
E_LEN];
f98ffff8b8aae8 Jie Hai 2022-08-30  875  	struct debugfs_regset32 *regsets;
f98ffff8b8aae8 Jie Hai 2022-08-30  876  	struct debugfs_reg32 *regs;
f98ffff8b8aae8 Jie Hai 2022-08-30  877  	struct dentry *chan_dir;
f98ffff8b8aae8 Jie Hai 2022-08-30  878  	struct device *dev;
f98ffff8b8aae8 Jie Hai 2022-08-30 @879  	u32 regs_sz;
f98ffff8b8aae8 Jie Hai 2022-08-30  880  	int ret;
f98ffff8b8aae8 Jie Hai 2022-08-30  881  	int i;
f98ffff8b8aae8 Jie Hai 2022-08-30  882  =

f98ffff8b8aae8 Jie Hai 2022-08-30  883  	dev =3D &hdma_dev->pdev->dev;
f98ffff8b8aae8 Jie Hai 2022-08-30  884  =

f98ffff8b8aae8 Jie Hai 2022-08-30  885  	regsets =3D devm_kcalloc(dev, hdma=
_dev->chan_num,
f98ffff8b8aae8 Jie Hai 2022-08-30  886  			       sizeof(*regsets), GFP_KER=
NEL);
f98ffff8b8aae8 Jie Hai 2022-08-30  887  	if (!regsets)
f98ffff8b8aae8 Jie Hai 2022-08-30  888  		return -ENOMEM;
f98ffff8b8aae8 Jie Hai 2022-08-30  889  =

f98ffff8b8aae8 Jie Hai 2022-08-30  890  	regs =3D hisi_dma_get_ch_regs(hdma=
_dev, &regs_sz);
f98ffff8b8aae8 Jie Hai 2022-08-30  891  	if (!regs)
f98ffff8b8aae8 Jie Hai 2022-08-30  892  		return -ENOMEM;
f98ffff8b8aae8 Jie Hai 2022-08-30  893  =

f98ffff8b8aae8 Jie Hai 2022-08-30  894  	for (i =3D 0; i < hdma_dev->chan_n=
um; i++) {
f98ffff8b8aae8 Jie Hai 2022-08-30  895  		regsets[i].regs =3D regs;
f98ffff8b8aae8 Jie Hai 2022-08-30  896  		regsets[i].nregs =3D regs_sz;
f98ffff8b8aae8 Jie Hai 2022-08-30  897  		regsets[i].base =3D hdma_dev->que=
ue_base + i * HISI_DMA_Q_OFFSET;
f98ffff8b8aae8 Jie Hai 2022-08-30  898  		regsets[i].dev =3D dev;
f98ffff8b8aae8 Jie Hai 2022-08-30  899  =

f98ffff8b8aae8 Jie Hai 2022-08-30  900  		memset(dir_name, 0, HISI_DMA_MAX_=
DIR_NAME_LEN);
f98ffff8b8aae8 Jie Hai 2022-08-30  901  		ret =3D sprintf(dir_name, "channe=
l%d", i);
f98ffff8b8aae8 Jie Hai 2022-08-30  902  		if (ret < 0)
f98ffff8b8aae8 Jie Hai 2022-08-30  903  			return ret;
f98ffff8b8aae8 Jie Hai 2022-08-30  904  =

f98ffff8b8aae8 Jie Hai 2022-08-30  905  		chan_dir =3D debugfs_create_dir(d=
ir_name,
f98ffff8b8aae8 Jie Hai 2022-08-30  906  					      hdma_dev->dma_dev.dbg_de=
v_root);
f98ffff8b8aae8 Jie Hai 2022-08-30  907  		debugfs_create_regset32("regs", 0=
444, chan_dir, &regsets[i]);
f98ffff8b8aae8 Jie Hai 2022-08-30  908  	}
f98ffff8b8aae8 Jie Hai 2022-08-30  909  =

f98ffff8b8aae8 Jie Hai 2022-08-30  910  	return 0;
f98ffff8b8aae8 Jie Hai 2022-08-30  911  }
f98ffff8b8aae8 Jie Hai 2022-08-30  912  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8021915165011154059==--

