Content-Type: multipart/mixed; boundary="===============5871464071109142170=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/vdpa/ifcvf/ifcvf_main.c:306 ifcvf_request_config_irq() error: uninitialized symbol 'config_vector'.
Date: Sat, 02 Apr 2022 22:30:31 +0800
Message-ID: <202204022231.tKB4fuN9-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5871464071109142170==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Zhu Lingshan <lingshan.zhu@intel.com>
CC: "Michael S. Tsirkin" <mst@redhat.com>
CC: Tom Rix <trix@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   88e6c0207623874922712e162e25d9dafd39661e
commit: 9b3e814834009a7d197ab6f93d6e061c0c4ee7e6 vDPA/ifcvf: implement shar=
ed IRQ feature
date:   5 days ago
:::::: branch date: 11 hours ago
:::::: commit date: 5 days ago
config: ia64-randconfig-m031-20220401 (https://download.01.org/0day-ci/arch=
ive/20220402/202204022231.tKB4fuN9-lkp(a)intel.com/config)
compiler: ia64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/vdpa/ifcvf/ifcvf_main.c:306 ifcvf_request_config_irq() error: unini=
tialized symbol 'config_vector'.

vim +/config_vector +306 drivers/vdpa/ifcvf/ifcvf_main.c

7dd793f37e2ab4 Zhu Lingshan 2020-05-12  286  =

9b3e814834009a Zhu Lingshan 2022-02-22  287  static int ifcvf_request_confi=
g_irq(struct ifcvf_adapter *adapter)
9b3e814834009a Zhu Lingshan 2022-02-22  288  {
9b3e814834009a Zhu Lingshan 2022-02-22  289  	struct pci_dev *pdev =3D adap=
ter->pdev;
9b3e814834009a Zhu Lingshan 2022-02-22  290  	struct ifcvf_hw *vf =3D &adap=
ter->vf;
9b3e814834009a Zhu Lingshan 2022-02-22  291  	int config_vector, ret;
9b3e814834009a Zhu Lingshan 2022-02-22  292  =

9b3e814834009a Zhu Lingshan 2022-02-22  293  	if (vf->msix_vector_status =
=3D=3D MSIX_VECTOR_DEV_SHARED)
9b3e814834009a Zhu Lingshan 2022-02-22  294  		return 0;
9b3e814834009a Zhu Lingshan 2022-02-22  295  =

9b3e814834009a Zhu Lingshan 2022-02-22  296  	if (vf->msix_vector_status =
=3D=3D MSIX_VECTOR_PER_VQ_AND_CONFIG)
9b3e814834009a Zhu Lingshan 2022-02-22  297  		/* vector 0 ~ vf->nr_vring f=
or vqs, num vf->nr_vring vector for config interrupt */
9b3e814834009a Zhu Lingshan 2022-02-22  298  		config_vector =3D vf->nr_vri=
ng;
9b3e814834009a Zhu Lingshan 2022-02-22  299  =

9b3e814834009a Zhu Lingshan 2022-02-22  300  	if (vf->msix_vector_status =
=3D=3D  MSIX_VECTOR_SHARED_VQ_AND_CONFIG)
9b3e814834009a Zhu Lingshan 2022-02-22  301  		/* vector 0 for vqs and 1 fo=
r config interrupt */
9b3e814834009a Zhu Lingshan 2022-02-22  302  		config_vector =3D 1;
9b3e814834009a Zhu Lingshan 2022-02-22  303  =

9b3e814834009a Zhu Lingshan 2022-02-22  304  	snprintf(vf->config_msix_name=
, 256, "ifcvf[%s]-config\n",
9b3e814834009a Zhu Lingshan 2022-02-22  305  		 pci_name(pdev));
9b3e814834009a Zhu Lingshan 2022-02-22 @306  	vf->config_irq =3D pci_irq_ve=
ctor(pdev, config_vector);
9b3e814834009a Zhu Lingshan 2022-02-22  307  	ret =3D devm_request_irq(&pde=
v->dev, vf->config_irq,
9b3e814834009a Zhu Lingshan 2022-02-22  308  			       ifcvf_config_changed=
, 0,
9b3e814834009a Zhu Lingshan 2022-02-22  309  			       vf->config_msix_name=
, vf);
9b3e814834009a Zhu Lingshan 2022-02-22  310  	if (ret) {
9b3e814834009a Zhu Lingshan 2022-02-22  311  		IFCVF_ERR(pdev, "Failed to r=
equest config irq\n");
9b3e814834009a Zhu Lingshan 2022-02-22  312  		goto err;
9b3e814834009a Zhu Lingshan 2022-02-22  313  	}
9b3e814834009a Zhu Lingshan 2022-02-22  314  =

9b3e814834009a Zhu Lingshan 2022-02-22  315  	ret =3D ifcvf_set_config_vect=
or(vf, config_vector);
9b3e814834009a Zhu Lingshan 2022-02-22  316  	if (ret =3D=3D VIRTIO_MSI_NO_=
VECTOR) {
9b3e814834009a Zhu Lingshan 2022-02-22  317  		IFCVF_ERR(pdev, "No msix vec=
tor for device config\n");
9b3e814834009a Zhu Lingshan 2022-02-22  318  		goto err;
9b3e814834009a Zhu Lingshan 2022-02-22  319  	}
9b3e814834009a Zhu Lingshan 2022-02-22  320  =

9b3e814834009a Zhu Lingshan 2022-02-22  321  	return 0;
9b3e814834009a Zhu Lingshan 2022-02-22  322  err:
9b3e814834009a Zhu Lingshan 2022-02-22  323  	ifcvf_free_irq(adapter);
9b3e814834009a Zhu Lingshan 2022-02-22  324  =

9b3e814834009a Zhu Lingshan 2022-02-22  325  	return -EFAULT;
9b3e814834009a Zhu Lingshan 2022-02-22  326  }
9b3e814834009a Zhu Lingshan 2022-02-22  327  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5871464071109142170==--

