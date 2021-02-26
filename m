Content-Type: multipart/mixed; boundary="===============3177653948460470354=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [intel-linux-intel-lts:5.10/yocto 4022/4981] drivers/scsi/fnic/fnic_res.c:96 fnic_get_vnic_config() warn: '__UNIQUE_ID___x341' 255000 can't fit into 65535 'c->ed_tov'
Date: Fri, 26 Feb 2021 14:52:46 +0300
Message-ID: <20210226115245.GY2087@kadam>
In-Reply-To: <202102261912.XGgwo7Qm-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3177653948460470354==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I think this is a good warning but it's from 2009.  I don't know how
commit 9deb7e3c0fcc ("PCI: Add pci_rebar_bytes_to_size()") is getting
blamed for it.

The bug is that VNIC_FNIC_EDTOV_MAX won't fit into c->ed_tov which is a
u16.

regards,
dan carpenter

On Fri, Feb 26, 2021 at 07:05:24PM +0800, kernel test robot wrote:
> CC: kbuild-all(a)lists.01.org
> TO: Nirmoy Das <nirmoy.das@amd.com>
> CC: Junxiao Chang <junxiao.chang@intel.com>
> CC: Darren Salt <devspam@moreofthesa.me.uk>
> CC: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> =

> tree:   https://github.com/intel/linux-intel-lts.git 5.10/yocto
> head:   7cfb36e6723a35fff2ec893a38e9dcc5966da2d5
> commit: 9deb7e3c0fcc8783a8a284d12c2f8aa2b5408484 [4022/4981] PCI: Add pci=
_rebar_bytes_to_size()
> :::::: branch date: 6 days ago
> :::::: commit date: 5 weeks ago
> config: i386-randconfig-m021-20210226 (attached as .config)
> compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> =

> smatch warnings:
> drivers/scsi/fnic/fnic_res.c:96 fnic_get_vnic_config() warn: '__UNIQUE_ID=
___x341' 255000 can't fit into 65535 'c->ed_tov'
> drivers/scsi/fnic/fnic_res.c:101 fnic_get_vnic_config() warn: '__UNIQUE_I=
D___x345' 255000 can't fit into 65535 'c->ra_tov'
> =

> vim +96 drivers/scsi/fnic/fnic_res.c
> =

> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17   33  =

> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17   34  int fnic_get_vnic_confi=
g(struct fnic *fnic)
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17   35  {
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17   36  	struct vnic_fc_config =
*c =3D &fnic->config;
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17   37  	int err;
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17   38  =

> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17   39  #define GET_CONFIG(m) \
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17   40  	do { \
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17   41  		err =3D vnic_dev_spec=
(fnic->vdev, \
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17   42  				    offsetof(struct=
 vnic_fc_config, m), \
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17   43  				    sizeof(c->m), &=
c->m); \
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17   44  		if (err) { \
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17   45  			shost_printk(KERN_ER=
R, fnic->lport->host, \
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17   46  				     "Error getting=
 %s, %d\n", #m, \
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17   47  				     err); \
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17   48  			return err; \
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17   49  		} \
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17   50  	} while (0);
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17   51  =

> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17   52  	GET_CONFIG(node_wwn);
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17   53  	GET_CONFIG(port_wwn);
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17   54  	GET_CONFIG(wq_enet_des=
c_count);
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17   55  	GET_CONFIG(wq_copy_des=
c_count);
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17   56  	GET_CONFIG(rq_desc_cou=
nt);
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17   57  	GET_CONFIG(maxdatafiel=
dsize);
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17   58  	GET_CONFIG(ed_tov);
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17   59  	GET_CONFIG(ra_tov);
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17   60  	GET_CONFIG(intr_timer);
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17   61  	GET_CONFIG(intr_timer_=
type);
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17   62  	GET_CONFIG(flags);
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17   63  	GET_CONFIG(flogi_retri=
es);
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17   64  	GET_CONFIG(flogi_timeo=
ut);
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17   65  	GET_CONFIG(plogi_retri=
es);
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17   66  	GET_CONFIG(plogi_timeo=
ut);
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17   67  	GET_CONFIG(io_throttle=
_count);
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17   68  	GET_CONFIG(link_down_t=
imeout);
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17   69  	GET_CONFIG(port_down_t=
imeout);
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17   70  	GET_CONFIG(port_down_i=
o_retries);
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17   71  	GET_CONFIG(luns_per_tg=
t);
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17   72  =

> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17   73  	c->wq_enet_desc_count =
=3D
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17   74  		min_t(u32, VNIC_FNIC_=
WQ_DESCS_MAX,
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17   75  		      max_t(u32, VNIC=
_FNIC_WQ_DESCS_MIN,
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17   76  			    c->wq_enet_desc_=
count));
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17   77  	c->wq_enet_desc_count =
=3D ALIGN(c->wq_enet_desc_count, 16);
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17   78  =

> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17   79  	c->wq_copy_desc_count =
=3D
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17   80  		min_t(u32, VNIC_FNIC_=
WQ_COPY_DESCS_MAX,
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17   81  		      max_t(u32, VNIC=
_FNIC_WQ_COPY_DESCS_MIN,
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17   82  			    c->wq_copy_desc_=
count));
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17   83  	c->wq_copy_desc_count =
=3D ALIGN(c->wq_copy_desc_count, 16);
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17   84  =

> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17   85  	c->rq_desc_count =3D
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17   86  		min_t(u32, VNIC_FNIC_=
RQ_DESCS_MAX,
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17   87  		      max_t(u32, VNIC=
_FNIC_RQ_DESCS_MIN,
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17   88  			    c->rq_desc_count=
));
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17   89  	c->rq_desc_count =3D A=
LIGN(c->rq_desc_count, 16);
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17   90  =

> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17   91  	c->maxdatafieldsize =
=3D
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17   92  		min_t(u16, VNIC_FNIC_=
MAXDATAFIELDSIZE_MAX,
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17   93  		      max_t(u16, VNIC=
_FNIC_MAXDATAFIELDSIZE_MIN,
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17   94  			    c->maxdatafields=
ize));
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17   95  	c->ed_tov =3D
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  @96  		min_t(u32, VNIC_FNIC_=
EDTOV_MAX,
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17   97  		      max_t(u32, VNIC=
_FNIC_EDTOV_MIN,
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17   98  			    c->ed_tov));
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17   99  =

> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  100  	c->ra_tov =3D
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17 @101  		min_t(u32, VNIC_FNIC_=
RATOV_MAX,
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  102  		      max_t(u32, VNIC=
_FNIC_RATOV_MIN,
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  103  			    c->ra_tov));
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  104  =

> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  105  	c->flogi_retries =3D
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  106  		min_t(u32, VNIC_FNIC_=
FLOGI_RETRIES_MAX, c->flogi_retries);
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  107  =

> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  108  	c->flogi_timeout =3D
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  109  		min_t(u32, VNIC_FNIC_=
FLOGI_TIMEOUT_MAX,
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  110  		      max_t(u32, VNIC=
_FNIC_FLOGI_TIMEOUT_MIN,
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  111  			    c->flogi_timeout=
));
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  112  =

> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  113  	c->plogi_retries =3D
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  114  		min_t(u32, VNIC_FNIC_=
PLOGI_RETRIES_MAX, c->plogi_retries);
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  115  =

> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  116  	c->plogi_timeout =3D
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  117  		min_t(u32, VNIC_FNIC_=
PLOGI_TIMEOUT_MAX,
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  118  		      max_t(u32, VNIC=
_FNIC_PLOGI_TIMEOUT_MIN,
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  119  			    c->plogi_timeout=
));
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  120  =

> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  121  	c->io_throttle_count =
=3D
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  122  		min_t(u32, VNIC_FNIC_=
IO_THROTTLE_COUNT_MAX,
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  123  		      max_t(u32, VNIC=
_FNIC_IO_THROTTLE_COUNT_MIN,
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  124  			    c->io_throttle_c=
ount));
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  125  =

> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  126  	c->link_down_timeout =
=3D
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  127  		min_t(u32, VNIC_FNIC_=
LINK_DOWN_TIMEOUT_MAX,
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  128  		      c->link_down_ti=
meout);
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  129  =

> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  130  	c->port_down_timeout =
=3D
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  131  		min_t(u32, VNIC_FNIC_=
PORT_DOWN_TIMEOUT_MAX,
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  132  		      c->port_down_ti=
meout);
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  133  =

> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  134  	c->port_down_io_retrie=
s =3D
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  135  		min_t(u32, VNIC_FNIC_=
PORT_DOWN_IO_RETRIES_MAX,
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  136  		      c->port_down_io=
_retries);
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  137  =

> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  138  	c->luns_per_tgt =3D
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  139  		min_t(u32, VNIC_FNIC_=
LUNS_PER_TARGET_MAX,
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  140  		      max_t(u32, VNIC=
_FNIC_LUNS_PER_TARGET_MIN,
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  141  			    c->luns_per_tgt)=
);
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  142  =

> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  143  	c->intr_timer =3D min_=
t(u16, VNIC_INTR_TIMER_MAX, c->intr_timer);
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  144  	c->intr_timer_type =3D=
 c->intr_timer_type;
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  145  =

> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  146  	shost_printk(KERN_INFO=
, fnic->lport->host,
> 78112e5558064c Joe Eykholt       2009-11-03  147  		     "vNIC MAC addr %=
pM "
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  148  		     "wq/wq_copy/rq %=
d/%d/%d\n",
> 78112e5558064c Joe Eykholt       2009-11-03  149  		     fnic->ctlr.ctl_s=
rc_addr,
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  150  		     c->wq_enet_desc_=
count, c->wq_copy_desc_count,
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  151  		     c->rq_desc_count=
);
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  152  	shost_printk(KERN_INFO=
, fnic->lport->host,
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  153  		     "vNIC node wwn %=
llx port wwn %llx\n",
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  154  		     c->node_wwn, c->=
port_wwn);
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  155  	shost_printk(KERN_INFO=
, fnic->lport->host,
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  156  		     "vNIC ed_tov %d =
ra_tov %d\n",
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  157  		     c->ed_tov, c->ra=
_tov);
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  158  	shost_printk(KERN_INFO=
, fnic->lport->host,
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  159  		     "vNIC mtu %d int=
r timer %d\n",
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  160  		     c->maxdatafields=
ize, c->intr_timer);
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  161  	shost_printk(KERN_INFO=
, fnic->lport->host,
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  162  		     "vNIC flags 0x%x=
 luns per tgt %d\n",
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  163  		     c->flags, c->lun=
s_per_tgt);
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  164  	shost_printk(KERN_INFO=
, fnic->lport->host,
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  165  		     "vNIC flogi_retr=
ies %d flogi timeout %d\n",
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  166  		     c->flogi_retries=
, c->flogi_timeout);
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  167  	shost_printk(KERN_INFO=
, fnic->lport->host,
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  168  		     "vNIC plogi retr=
ies %d plogi timeout %d\n",
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  169  		     c->plogi_retries=
, c->plogi_timeout);
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  170  	shost_printk(KERN_INFO=
, fnic->lport->host,
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  171  		     "vNIC io throttl=
e count %d link dn timeout %d\n",
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  172  		     c->io_throttle_c=
ount, c->link_down_timeout);
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  173  	shost_printk(KERN_INFO=
, fnic->lport->host,
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  174  		     "vNIC port dn io=
 retries %d port dn timeout %d\n",
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  175  		     c->port_down_io_=
retries, c->port_down_timeout);
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  176  =

> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  177  	return 0;
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  178  }
> 5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  179  =

> =

> :::::: The code at line 96 was first introduced by commit
> :::::: 5df6d737dd4b0fe9eccf943abb3677cfea05a6c4 [SCSI] fnic: Add new Cisc=
o PCI-Express FCoE HBA
> =

> :::::: TO: Abhijeet Joglekar <abjoglek@cisco.com>
> :::::: CC: James Bottomley <James.Bottomley@HansenPartnership.com>
> =

> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org


--===============3177653948460470354==--

