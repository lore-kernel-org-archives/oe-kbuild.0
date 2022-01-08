Content-Type: multipart/mixed; boundary="===============5822288755112993119=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [mkp-scsi:for-next 67/132] drivers/scsi/elx/libefc/efc_els.c:73 efc_els_io_alloc_size() warn: sleeping in atomic context
Date: Sat, 08 Jan 2022 23:50:23 +0800
Message-ID: <202201082354.iAG3UuiL-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5822288755112993119==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Christoph Hellwig <hch@lst.de>
CC: "Martin K. Petersen" <martin.petersen@oracle.com>
CC: James Smart <jsmart2021@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mkp/scsi.git for-ne=
xt
head:   315d049ad1951cef02d9337a2469cac51cca6932
commit: efac162a4e4dc4cebcc658e02676821ca834b56c [67/132] scsi: efct: Don't=
 pass GFP_DMA to dma_alloc_coherent()
:::::: branch date: 25 hours ago
:::::: commit date: 3 weeks ago
config: x86_64-randconfig-m031-20220107 (https://download.01.org/0day-ci/ar=
chive/20220108/202201082354.iAG3UuiL-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/scsi/elx/libefc/efc_els.c:73 efc_els_io_alloc_size() warn: sleeping=
 in atomic context

vim +73 drivers/scsi/elx/libefc/efc_els.c

8f406ef728597d James Smart       2021-06-01   39  =

8f406ef728597d James Smart       2021-06-01   40  struct efc_els_io_req *
8f406ef728597d James Smart       2021-06-01   41  efc_els_io_alloc_size(str=
uct efc_node *node, u32 reqlen, u32 rsplen)
8f406ef728597d James Smart       2021-06-01   42  {
8f406ef728597d James Smart       2021-06-01   43  	struct efc *efc;
8f406ef728597d James Smart       2021-06-01   44  	struct efc_els_io_req *e=
ls;
8f406ef728597d James Smart       2021-06-01   45  	unsigned long flags =3D =
0;
8f406ef728597d James Smart       2021-06-01   46  =

8f406ef728597d James Smart       2021-06-01   47  	efc =3D node->efc;
8f406ef728597d James Smart       2021-06-01   48  =

8f406ef728597d James Smart       2021-06-01   49  	spin_lock_irqsave(&node-=
>els_ios_lock, flags);
8f406ef728597d James Smart       2021-06-01   50  =

8f406ef728597d James Smart       2021-06-01   51  	if (!node->els_io_enable=
d) {
8f406ef728597d James Smart       2021-06-01   52  		efc_log_err(efc, "els i=
o alloc disabled\n");
8f406ef728597d James Smart       2021-06-01   53  		spin_unlock_irqrestore(=
&node->els_ios_lock, flags);
8f406ef728597d James Smart       2021-06-01   54  		return NULL;
8f406ef728597d James Smart       2021-06-01   55  	}
8f406ef728597d James Smart       2021-06-01   56  =

8f406ef728597d James Smart       2021-06-01   57  	els =3D mempool_alloc(ef=
c->els_io_pool, GFP_ATOMIC);
8f406ef728597d James Smart       2021-06-01   58  	if (!els) {
8f406ef728597d James Smart       2021-06-01   59  		atomic_add_return(1, &e=
fc->els_io_alloc_failed_count);
8f406ef728597d James Smart       2021-06-01   60  		spin_unlock_irqrestore(=
&node->els_ios_lock, flags);
8f406ef728597d James Smart       2021-06-01   61  		return NULL;
8f406ef728597d James Smart       2021-06-01   62  	}
8f406ef728597d James Smart       2021-06-01   63  =

8f406ef728597d James Smart       2021-06-01   64  	/* initialize refcount */
8f406ef728597d James Smart       2021-06-01   65  	kref_init(&els->ref);
8f406ef728597d James Smart       2021-06-01   66  	els->release =3D _efc_el=
s_io_free;
8f406ef728597d James Smart       2021-06-01   67  =

8f406ef728597d James Smart       2021-06-01   68  	/* populate generic io f=
ields */
8f406ef728597d James Smart       2021-06-01   69  	els->node =3D node;
8f406ef728597d James Smart       2021-06-01   70  =

8f406ef728597d James Smart       2021-06-01   71  	/* now allocate DMA for =
request and response */
8f406ef728597d James Smart       2021-06-01   72  	els->io.req.size =3D req=
len;
8f406ef728597d James Smart       2021-06-01  @73  	els->io.req.virt =3D dma=
_alloc_coherent(&efc->pci->dev, els->io.req.size,
efac162a4e4dc4 Christoph Hellwig 2021-12-14   74  					      &els->io.req.p=
hys, GFP_KERNEL);
8f406ef728597d James Smart       2021-06-01   75  	if (!els->io.req.virt) {
8f406ef728597d James Smart       2021-06-01   76  		mempool_free(els, efc->=
els_io_pool);
8f406ef728597d James Smart       2021-06-01   77  		spin_unlock_irqrestore(=
&node->els_ios_lock, flags);
8f406ef728597d James Smart       2021-06-01   78  		return NULL;
8f406ef728597d James Smart       2021-06-01   79  	}
8f406ef728597d James Smart       2021-06-01   80  =

8f406ef728597d James Smart       2021-06-01   81  	els->io.rsp.size =3D rsp=
len;
8f406ef728597d James Smart       2021-06-01   82  	els->io.rsp.virt =3D dma=
_alloc_coherent(&efc->pci->dev, els->io.rsp.size,
efac162a4e4dc4 Christoph Hellwig 2021-12-14   83  					      &els->io.rsp.p=
hys, GFP_KERNEL);
8f406ef728597d James Smart       2021-06-01   84  	if (!els->io.rsp.virt) {
8f406ef728597d James Smart       2021-06-01   85  		dma_free_coherent(&efc-=
>pci->dev, els->io.req.size,
8f406ef728597d James Smart       2021-06-01   86  				  els->io.req.virt, e=
ls->io.req.phys);
8f406ef728597d James Smart       2021-06-01   87  		mempool_free(els, efc->=
els_io_pool);
8f406ef728597d James Smart       2021-06-01   88  		els =3D NULL;
8f406ef728597d James Smart       2021-06-01   89  	}
8f406ef728597d James Smart       2021-06-01   90  =

8f406ef728597d James Smart       2021-06-01   91  	if (els) {
8f406ef728597d James Smart       2021-06-01   92  		/* initialize fields */
8f406ef728597d James Smart       2021-06-01   93  		els->els_retries_remain=
ing =3D EFC_FC_ELS_DEFAULT_RETRIES;
8f406ef728597d James Smart       2021-06-01   94  =

8f406ef728597d James Smart       2021-06-01   95  		/* add els structure to=
 ELS IO list */
8f406ef728597d James Smart       2021-06-01   96  		INIT_LIST_HEAD(&els->li=
st_entry);
8f406ef728597d James Smart       2021-06-01   97  		list_add_tail(&els->lis=
t_entry, &node->els_ios_list);
8f406ef728597d James Smart       2021-06-01   98  	}
8f406ef728597d James Smart       2021-06-01   99  =

8f406ef728597d James Smart       2021-06-01  100  	spin_unlock_irqrestore(&=
node->els_ios_lock, flags);
8f406ef728597d James Smart       2021-06-01  101  	return els;
8f406ef728597d James Smart       2021-06-01  102  }
8f406ef728597d James Smart       2021-06-01  103  =


:::::: The code at line 73 was first introduced by commit
:::::: 8f406ef728597da39c935ab9c12f4940139775f9 scsi: elx: libefc: Extended=
 link Service I/O handling

:::::: TO: James Smart <jsmart2021@gmail.com>
:::::: CC: Martin K. Petersen <martin.petersen@oracle.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5822288755112993119==--

