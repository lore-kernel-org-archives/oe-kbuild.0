Content-Type: multipart/mixed; boundary="===============3840328229761846869=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH V9 4/9] cxl/pci: Create PCI DOE mailbox's for memory devices
Date: Wed, 01 Jun 2022 13:44:28 +0800
Message-ID: <202206011300.xtt4Q8PJ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3840328229761846869==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220531152632.1397976-5-ira.weiny@intel.com>
References: <20220531152632.1397976-5-ira.weiny@intel.com>
TO: ira.weiny(a)intel.com

Hi,

I love your patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on next-20220601]
[cannot apply to helgaas-pci/next v5.18]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/ira-weiny-intel-com/=
CXL-Read-CDAT-and-DSMAS-data/20220531-232807
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
8ab2afa23bd197df47819a87f0265c0ac95c5b6a
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20220=
601/202206011300.xtt4Q8PJ-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-1) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/pci/doe.c:324 doe_statemachine_work() error: uninitialized symbol '=
rc'.

vim +/rc +324 drivers/pci/doe.c

c67f0d52ff51105 Jonathan Cameron 2022-05-31  182  =

c67f0d52ff51105 Jonathan Cameron 2022-05-31  183  static void doe_statemach=
ine_work(struct work_struct *work)
c67f0d52ff51105 Jonathan Cameron 2022-05-31  184  {
c67f0d52ff51105 Jonathan Cameron 2022-05-31  185  	struct delayed_work *w =
=3D to_delayed_work(work);
c67f0d52ff51105 Jonathan Cameron 2022-05-31  186  	struct pci_doe_mb *doe_m=
b =3D container_of(w, struct pci_doe_mb,
c67f0d52ff51105 Jonathan Cameron 2022-05-31  187  						 statemachine);
c67f0d52ff51105 Jonathan Cameron 2022-05-31  188  	struct pci_dev *pdev =3D=
 doe_mb->pdev;
c67f0d52ff51105 Jonathan Cameron 2022-05-31  189  	int offset =3D doe_mb->c=
ap_offset;
c67f0d52ff51105 Jonathan Cameron 2022-05-31  190  	struct pci_doe_task *tas=
k;
c67f0d52ff51105 Jonathan Cameron 2022-05-31  191  	u32 val;
c67f0d52ff51105 Jonathan Cameron 2022-05-31  192  	int rc;
c67f0d52ff51105 Jonathan Cameron 2022-05-31  193  =

c67f0d52ff51105 Jonathan Cameron 2022-05-31  194  	mutex_lock(&doe_mb->task=
_lock);
c67f0d52ff51105 Jonathan Cameron 2022-05-31  195  	task =3D doe_mb->cur_tas=
k;
c67f0d52ff51105 Jonathan Cameron 2022-05-31  196  	mutex_unlock(&doe_mb->ta=
sk_lock);
c67f0d52ff51105 Jonathan Cameron 2022-05-31  197  =

c67f0d52ff51105 Jonathan Cameron 2022-05-31  198  	if (test_and_clear_bit(P=
CI_DOE_FLAG_ABORT, &doe_mb->flags)) {
c67f0d52ff51105 Jonathan Cameron 2022-05-31  199  		/*
c67f0d52ff51105 Jonathan Cameron 2022-05-31  200  		 * Currently only used =
during init - care needed if
c67f0d52ff51105 Jonathan Cameron 2022-05-31  201  		 * pci_doe_abort() is g=
enerally exposed as it would impact
c67f0d52ff51105 Jonathan Cameron 2022-05-31  202  		 * queries in flight.
c67f0d52ff51105 Jonathan Cameron 2022-05-31  203  		 */
c67f0d52ff51105 Jonathan Cameron 2022-05-31  204  		if (task)
c67f0d52ff51105 Jonathan Cameron 2022-05-31  205  			pci_err(pdev, "DOE [%x=
] Aborting with active task!\n",
c67f0d52ff51105 Jonathan Cameron 2022-05-31  206  				doe_mb->cap_offset);
c67f0d52ff51105 Jonathan Cameron 2022-05-31  207  		doe_mb->state =3D DOE_W=
AIT_ABORT;
c67f0d52ff51105 Jonathan Cameron 2022-05-31  208  		pci_doe_abort_start(doe=
_mb);
c67f0d52ff51105 Jonathan Cameron 2022-05-31  209  		return;
c67f0d52ff51105 Jonathan Cameron 2022-05-31  210  	}
c67f0d52ff51105 Jonathan Cameron 2022-05-31  211  =

c67f0d52ff51105 Jonathan Cameron 2022-05-31  212  	switch (doe_mb->state) {
c67f0d52ff51105 Jonathan Cameron 2022-05-31  213  	case DOE_IDLE:
c67f0d52ff51105 Jonathan Cameron 2022-05-31  214  		if (task =3D=3D NULL)
c67f0d52ff51105 Jonathan Cameron 2022-05-31  215  			return;
c67f0d52ff51105 Jonathan Cameron 2022-05-31  216  =

c67f0d52ff51105 Jonathan Cameron 2022-05-31  217  		rc =3D pci_doe_send_req=
(doe_mb, task);
c67f0d52ff51105 Jonathan Cameron 2022-05-31  218  =

c67f0d52ff51105 Jonathan Cameron 2022-05-31  219  		/*
c67f0d52ff51105 Jonathan Cameron 2022-05-31  220  		 * The specification do=
es not provide any guidance on how long
c67f0d52ff51105 Jonathan Cameron 2022-05-31  221  		 * some other entity co=
uld keep the DOE busy, so try for 1
c67f0d52ff51105 Jonathan Cameron 2022-05-31  222  		 * second then fail. Bu=
sy handling is best effort only, because
c67f0d52ff51105 Jonathan Cameron 2022-05-31  223  		 * there is no way of a=
voiding racing against another user of
c67f0d52ff51105 Jonathan Cameron 2022-05-31  224  		 * the DOE.
c67f0d52ff51105 Jonathan Cameron 2022-05-31  225  		 */
c67f0d52ff51105 Jonathan Cameron 2022-05-31  226  		if (rc =3D=3D -EBUSY) {
c67f0d52ff51105 Jonathan Cameron 2022-05-31  227  			doe_mb->busy_retries++;
c67f0d52ff51105 Jonathan Cameron 2022-05-31  228  			if (doe_mb->busy_retri=
es =3D=3D PCI_DOE_BUSY_MAX_RETRIES) {
c67f0d52ff51105 Jonathan Cameron 2022-05-31  229  				/* Long enough, fail =
this request */
c67f0d52ff51105 Jonathan Cameron 2022-05-31  230  				pci_warn(pdev,
c67f0d52ff51105 Jonathan Cameron 2022-05-31  231  					"DOE [%x] busy for t=
oo long (> 1 sec)\n",
c67f0d52ff51105 Jonathan Cameron 2022-05-31  232  					doe_mb->cap_offset);
c67f0d52ff51105 Jonathan Cameron 2022-05-31  233  				doe_mb->busy_retries =
=3D 0;
c67f0d52ff51105 Jonathan Cameron 2022-05-31  234  				goto err_busy;
c67f0d52ff51105 Jonathan Cameron 2022-05-31  235  			}
c67f0d52ff51105 Jonathan Cameron 2022-05-31  236  			schedule_delayed_work(=
w, HZ / PCI_DOE_BUSY_MAX_RETRIES);
c67f0d52ff51105 Jonathan Cameron 2022-05-31  237  			return;
c67f0d52ff51105 Jonathan Cameron 2022-05-31  238  		}
c67f0d52ff51105 Jonathan Cameron 2022-05-31  239  		if (rc)
c67f0d52ff51105 Jonathan Cameron 2022-05-31  240  			goto err_abort;
c67f0d52ff51105 Jonathan Cameron 2022-05-31  241  		doe_mb->busy_retries =
=3D 0;
c67f0d52ff51105 Jonathan Cameron 2022-05-31  242  =

c67f0d52ff51105 Jonathan Cameron 2022-05-31  243  		doe_mb->state =3D DOE_W=
AIT_RESP;
c67f0d52ff51105 Jonathan Cameron 2022-05-31  244  		doe_mb->timeout_jiffies=
 =3D jiffies + HZ;
c67f0d52ff51105 Jonathan Cameron 2022-05-31  245  		/* Now poll or wait for=
 IRQ with timeout */
c67f0d52ff51105 Jonathan Cameron 2022-05-31  246  		if (doe_mb->irq >=3D 0)
c67f0d52ff51105 Jonathan Cameron 2022-05-31  247  			schedule_delayed_work(=
w, PCI_DOE_TIMEOUT);
c67f0d52ff51105 Jonathan Cameron 2022-05-31  248  		else
c67f0d52ff51105 Jonathan Cameron 2022-05-31  249  			schedule_delayed_work(=
w, PCI_DOE_POLL_INTERVAL);
c67f0d52ff51105 Jonathan Cameron 2022-05-31  250  		return;
c67f0d52ff51105 Jonathan Cameron 2022-05-31  251  =

c67f0d52ff51105 Jonathan Cameron 2022-05-31  252  	case DOE_WAIT_RESP:
c67f0d52ff51105 Jonathan Cameron 2022-05-31  253  		/* Not possible to get =
here with NULL task */
c67f0d52ff51105 Jonathan Cameron 2022-05-31  254  		pci_read_config_dword(p=
dev, offset + PCI_DOE_STATUS, &val);
c67f0d52ff51105 Jonathan Cameron 2022-05-31  255  		if (FIELD_GET(PCI_DOE_S=
TATUS_ERROR, val)) {
c67f0d52ff51105 Jonathan Cameron 2022-05-31  256  			rc =3D -EIO;
c67f0d52ff51105 Jonathan Cameron 2022-05-31  257  			goto err_abort;
c67f0d52ff51105 Jonathan Cameron 2022-05-31  258  		}
c67f0d52ff51105 Jonathan Cameron 2022-05-31  259  =

c67f0d52ff51105 Jonathan Cameron 2022-05-31  260  		if (!FIELD_GET(PCI_DOE_=
STATUS_DATA_OBJECT_READY, val)) {
c67f0d52ff51105 Jonathan Cameron 2022-05-31  261  			/* If not yet at timeo=
ut reschedule otherwise abort */
c67f0d52ff51105 Jonathan Cameron 2022-05-31  262  			if (time_after(jiffies=
, doe_mb->timeout_jiffies)) {
c67f0d52ff51105 Jonathan Cameron 2022-05-31  263  				rc =3D -ETIMEDOUT;
c67f0d52ff51105 Jonathan Cameron 2022-05-31  264  				goto err_abort;
c67f0d52ff51105 Jonathan Cameron 2022-05-31  265  			}
c67f0d52ff51105 Jonathan Cameron 2022-05-31  266  			schedule_delayed_work(=
w, PCI_DOE_POLL_INTERVAL);
c67f0d52ff51105 Jonathan Cameron 2022-05-31  267  			return;
c67f0d52ff51105 Jonathan Cameron 2022-05-31  268  		}
c67f0d52ff51105 Jonathan Cameron 2022-05-31  269  =

c67f0d52ff51105 Jonathan Cameron 2022-05-31  270  		rc  =3D pci_doe_recv_re=
sp(doe_mb, task);
c67f0d52ff51105 Jonathan Cameron 2022-05-31  271  		if (rc < 0)
c67f0d52ff51105 Jonathan Cameron 2022-05-31  272  			goto err_abort;
c67f0d52ff51105 Jonathan Cameron 2022-05-31  273  =

c67f0d52ff51105 Jonathan Cameron 2022-05-31  274  		doe_mb->state =3D DOE_I=
DLE;
c67f0d52ff51105 Jonathan Cameron 2022-05-31  275  =

c67f0d52ff51105 Jonathan Cameron 2022-05-31  276  		retire_cur_task(doe_mb);
c67f0d52ff51105 Jonathan Cameron 2022-05-31  277  		/* Set the return value=
 to the length of received payload */
c67f0d52ff51105 Jonathan Cameron 2022-05-31  278  		signal_task_complete(ta=
sk, rc);
c67f0d52ff51105 Jonathan Cameron 2022-05-31  279  =

c67f0d52ff51105 Jonathan Cameron 2022-05-31  280  		return;
c67f0d52ff51105 Jonathan Cameron 2022-05-31  281  =

c67f0d52ff51105 Jonathan Cameron 2022-05-31  282  	case DOE_WAIT_ABORT:
c67f0d52ff51105 Jonathan Cameron 2022-05-31  283  	case DOE_WAIT_ABORT_ON_E=
RR:
c67f0d52ff51105 Jonathan Cameron 2022-05-31  284  		pci_read_config_dword(p=
dev, offset + PCI_DOE_STATUS, &val);
c67f0d52ff51105 Jonathan Cameron 2022-05-31  285  =

c67f0d52ff51105 Jonathan Cameron 2022-05-31  286  		if (!FIELD_GET(PCI_DOE_=
STATUS_ERROR, val) &&
c67f0d52ff51105 Jonathan Cameron 2022-05-31  287  		    !FIELD_GET(PCI_DOE_=
STATUS_BUSY, val)) {
c67f0d52ff51105 Jonathan Cameron 2022-05-31  288  			/* Back to normal stat=
e - carry on */
c67f0d52ff51105 Jonathan Cameron 2022-05-31  289  			retire_cur_task(doe_mb=
);
c67f0d52ff51105 Jonathan Cameron 2022-05-31  290  =

c67f0d52ff51105 Jonathan Cameron 2022-05-31  291  			/*
c67f0d52ff51105 Jonathan Cameron 2022-05-31  292  			 * For deliberately tr=
iggered abort, someone is
c67f0d52ff51105 Jonathan Cameron 2022-05-31  293  			 * waiting.
c67f0d52ff51105 Jonathan Cameron 2022-05-31  294  			 */
c67f0d52ff51105 Jonathan Cameron 2022-05-31  295  			if (doe_mb->state =3D=
=3D DOE_WAIT_ABORT) {
c67f0d52ff51105 Jonathan Cameron 2022-05-31  296  				if (task)
c67f0d52ff51105 Jonathan Cameron 2022-05-31  297  					signal_task_complete=
(task, -EFAULT);
c67f0d52ff51105 Jonathan Cameron 2022-05-31  298  				complete(&doe_mb->abo=
rt_c);
c67f0d52ff51105 Jonathan Cameron 2022-05-31  299  			}
c67f0d52ff51105 Jonathan Cameron 2022-05-31  300  =

c67f0d52ff51105 Jonathan Cameron 2022-05-31  301  			doe_mb->state =3D DOE_=
IDLE;
c67f0d52ff51105 Jonathan Cameron 2022-05-31  302  			return;
c67f0d52ff51105 Jonathan Cameron 2022-05-31  303  		}
c67f0d52ff51105 Jonathan Cameron 2022-05-31  304  		if (time_after(jiffies,=
 doe_mb->timeout_jiffies)) {
c67f0d52ff51105 Jonathan Cameron 2022-05-31  305  			/* Task has timed out =
and is dead - abort */
c67f0d52ff51105 Jonathan Cameron 2022-05-31  306  			pci_err(pdev, "DOE [%x=
] ABORT timed out\n",
c67f0d52ff51105 Jonathan Cameron 2022-05-31  307  				doe_mb->cap_offset);
c67f0d52ff51105 Jonathan Cameron 2022-05-31  308  			set_bit(PCI_DOE_FLAG_D=
EAD, &doe_mb->flags);
c67f0d52ff51105 Jonathan Cameron 2022-05-31  309  			retire_cur_task(doe_mb=
);
c67f0d52ff51105 Jonathan Cameron 2022-05-31  310  =

c67f0d52ff51105 Jonathan Cameron 2022-05-31  311  			if (doe_mb->state =3D=
=3D DOE_WAIT_ABORT) {
c67f0d52ff51105 Jonathan Cameron 2022-05-31  312  				if (task)
c67f0d52ff51105 Jonathan Cameron 2022-05-31  313  					signal_task_complete=
(task, -EFAULT);
c67f0d52ff51105 Jonathan Cameron 2022-05-31  314  				complete(&doe_mb->abo=
rt_c);
c67f0d52ff51105 Jonathan Cameron 2022-05-31  315  			}
c67f0d52ff51105 Jonathan Cameron 2022-05-31  316  		}
c67f0d52ff51105 Jonathan Cameron 2022-05-31  317  		return;
c67f0d52ff51105 Jonathan Cameron 2022-05-31  318  	}
c67f0d52ff51105 Jonathan Cameron 2022-05-31  319  =

c67f0d52ff51105 Jonathan Cameron 2022-05-31  320  err_abort:
c67f0d52ff51105 Jonathan Cameron 2022-05-31  321  	doe_mb->state =3D DOE_WA=
IT_ABORT_ON_ERR;
c67f0d52ff51105 Jonathan Cameron 2022-05-31  322  	pci_doe_abort_start(doe_=
mb);
c67f0d52ff51105 Jonathan Cameron 2022-05-31  323  err_busy:
c67f0d52ff51105 Jonathan Cameron 2022-05-31 @324  	signal_task_complete(tas=
k, rc);
c67f0d52ff51105 Jonathan Cameron 2022-05-31  325  	if (doe_mb->state =3D=3D=
 DOE_IDLE)
c67f0d52ff51105 Jonathan Cameron 2022-05-31  326  		retire_cur_task(doe_mb);
c67f0d52ff51105 Jonathan Cameron 2022-05-31  327  }
c67f0d52ff51105 Jonathan Cameron 2022-05-31  328  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3840328229761846869==--

