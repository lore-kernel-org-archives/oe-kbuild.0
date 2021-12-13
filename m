Content-Type: multipart/mixed; boundary="===============4372422908980823998=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/infiniband/hw/qib/qib_user_sdma.c:1050 qib_user_sdma_queue_pkts() warn: possible memory leak of 'pkt'
Date: Mon, 13 Dec 2021 17:50:09 +0800
Message-ID: <202112131718.Qd0MpYaT-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4372422908980823998==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Mike Marciniszyn <mike.marciniszyn@cornelisnetworks.com>
CC: Jason Gunthorpe <jgg@nvidia.com>
CC: Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   2585cf9dfaaddf00b069673f27bb3f8530e2039c
commit: d39bf40e55e666b5905fdbd46a0dced030ce87be IB/qib: Protect from buffe=
r overflow in struct qib_user_sdma_pkt fields
date:   9 weeks ago
:::::: branch date: 11 hours ago
:::::: commit date: 9 weeks ago
config: x86_64-randconfig-m001-20211212 (https://download.01.org/0day-ci/ar=
chive/20211213/202112131718.Qd0MpYaT-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/infiniband/hw/qib/qib_user_sdma.c:1050 qib_user_sdma_queue_pkts() w=
arn: possible memory leak of 'pkt'

vim +/pkt +1050 drivers/infiniband/hw/qib/qib_user_sdma.c

f931551bafe1f1 Ralph Campbell      2010-05-23   794  =

f931551bafe1f1 Ralph Campbell      2010-05-23   795  /*
f931551bafe1f1 Ralph Campbell      2010-05-23   796   * copy headers, coale=
sce etc -- pq->lock must be held
f931551bafe1f1 Ralph Campbell      2010-05-23   797   *
f931551bafe1f1 Ralph Campbell      2010-05-23   798   * we queue all the pa=
ckets to list, returning the
f931551bafe1f1 Ralph Campbell      2010-05-23   799   * number of bytes tot=
al.  list must be empty initially,
f931551bafe1f1 Ralph Campbell      2010-05-23   800   * as, if there is an =
error we clean it...
f931551bafe1f1 Ralph Campbell      2010-05-23   801   */
f931551bafe1f1 Ralph Campbell      2010-05-23   802  static int qib_user_sd=
ma_queue_pkts(const struct qib_devdata *dd,
4668e4b527d226 CQ Tang             2013-07-19   803  				    struct qib_ppo=
rtdata *ppd,
f931551bafe1f1 Ralph Campbell      2010-05-23   804  				    struct qib_use=
r_sdma_queue *pq,
f931551bafe1f1 Ralph Campbell      2010-05-23   805  				    const struct i=
ovec *iov,
f931551bafe1f1 Ralph Campbell      2010-05-23   806  				    unsigned long =
niov,
4668e4b527d226 CQ Tang             2013-07-19   807  				    struct list_he=
ad *list,
4668e4b527d226 CQ Tang             2013-07-19   808  				    int *maxpkts, =
int *ndesc)
f931551bafe1f1 Ralph Campbell      2010-05-23   809  {
f931551bafe1f1 Ralph Campbell      2010-05-23   810  	unsigned long idx =3D=
 0;
f931551bafe1f1 Ralph Campbell      2010-05-23   811  	int ret =3D 0;
f931551bafe1f1 Ralph Campbell      2010-05-23   812  	int npkts =3D 0;
f931551bafe1f1 Ralph Campbell      2010-05-23   813  	__le32 *pbc;
f931551bafe1f1 Ralph Campbell      2010-05-23   814  	dma_addr_t dma_addr;
f931551bafe1f1 Ralph Campbell      2010-05-23   815  	struct qib_user_sdma_=
pkt *pkt =3D NULL;
f931551bafe1f1 Ralph Campbell      2010-05-23   816  	size_t len;
f931551bafe1f1 Ralph Campbell      2010-05-23   817  	size_t nw;
f931551bafe1f1 Ralph Campbell      2010-05-23   818  	u32 counter =3D pq->c=
ounter;
4668e4b527d226 CQ Tang             2013-07-19   819  	u16 frag_size;
f931551bafe1f1 Ralph Campbell      2010-05-23   820  =

4668e4b527d226 CQ Tang             2013-07-19   821  	while (idx < niov && =
npkts < *maxpkts) {
f931551bafe1f1 Ralph Campbell      2010-05-23   822  		const unsigned long =
addr =3D (unsigned long) iov[idx].iov_base;
f931551bafe1f1 Ralph Campbell      2010-05-23   823  		const unsigned long =
idx_save =3D idx;
f931551bafe1f1 Ralph Campbell      2010-05-23   824  		unsigned pktnw;
f931551bafe1f1 Ralph Campbell      2010-05-23   825  		unsigned pktnwc;
f931551bafe1f1 Ralph Campbell      2010-05-23   826  		int nfrags =3D 0;
d39bf40e55e666 Mike Marciniszyn    2021-10-12   827  		size_t npages =3D 0;
d39bf40e55e666 Mike Marciniszyn    2021-10-12   828  		size_t bytes_togo =
=3D 0;
4668e4b527d226 CQ Tang             2013-07-19   829  		int tiddma =3D 0;
f931551bafe1f1 Ralph Campbell      2010-05-23   830  		int cfur;
f931551bafe1f1 Ralph Campbell      2010-05-23   831  =

f931551bafe1f1 Ralph Campbell      2010-05-23   832  		len =3D iov[idx].iov=
_len;
f931551bafe1f1 Ralph Campbell      2010-05-23   833  		nw =3D len >> 2;
f931551bafe1f1 Ralph Campbell      2010-05-23   834  =

f931551bafe1f1 Ralph Campbell      2010-05-23   835  		if (len < QIB_USER_S=
DMA_MIN_HEADER_LENGTH ||
f931551bafe1f1 Ralph Campbell      2010-05-23   836  		    len > PAGE_SIZE =
|| len & 3 || addr & 3) {
f931551bafe1f1 Ralph Campbell      2010-05-23   837  			ret =3D -EINVAL;
4668e4b527d226 CQ Tang             2013-07-19   838  			goto free_list;
f931551bafe1f1 Ralph Campbell      2010-05-23   839  		}
f931551bafe1f1 Ralph Campbell      2010-05-23   840  =

4668e4b527d226 CQ Tang             2013-07-19   841  		pbc =3D qib_user_sdm=
a_alloc_header(pq, len, &dma_addr);
f931551bafe1f1 Ralph Campbell      2010-05-23   842  		if (!pbc) {
f931551bafe1f1 Ralph Campbell      2010-05-23   843  			ret =3D -ENOMEM;
4668e4b527d226 CQ Tang             2013-07-19   844  			goto free_list;
f931551bafe1f1 Ralph Campbell      2010-05-23   845  		}
f931551bafe1f1 Ralph Campbell      2010-05-23   846  =

f931551bafe1f1 Ralph Campbell      2010-05-23   847  		cfur =3D copy_from_u=
ser(pbc, iov[idx].iov_base, len);
f931551bafe1f1 Ralph Campbell      2010-05-23   848  		if (cfur) {
f931551bafe1f1 Ralph Campbell      2010-05-23   849  			ret =3D -EFAULT;
f931551bafe1f1 Ralph Campbell      2010-05-23   850  			goto free_pbc;
f931551bafe1f1 Ralph Campbell      2010-05-23   851  		}
f931551bafe1f1 Ralph Campbell      2010-05-23   852  =

f931551bafe1f1 Ralph Campbell      2010-05-23   853  		/*
f931551bafe1f1 Ralph Campbell      2010-05-23   854  		 * This assignment i=
s a bit strange.  it's because the
f931551bafe1f1 Ralph Campbell      2010-05-23   855  		 * the pbc counts th=
e number of 32 bit words in the full
f931551bafe1f1 Ralph Campbell      2010-05-23   856  		 * packet _except_ t=
he first word of the pbc itself...
f931551bafe1f1 Ralph Campbell      2010-05-23   857  		 */
f931551bafe1f1 Ralph Campbell      2010-05-23   858  		pktnwc =3D nw - 1;
f931551bafe1f1 Ralph Campbell      2010-05-23   859  =

f931551bafe1f1 Ralph Campbell      2010-05-23   860  		/*
f931551bafe1f1 Ralph Campbell      2010-05-23   861  		 * pktnw computation=
 yields the number of 32 bit words
f931551bafe1f1 Ralph Campbell      2010-05-23   862  		 * that the caller h=
as indicated in the PBC.  note that
f931551bafe1f1 Ralph Campbell      2010-05-23   863  		 * this is one less =
than the total number of words that
f931551bafe1f1 Ralph Campbell      2010-05-23   864  		 * goes to the send =
DMA engine as the first 32 bit word
f931551bafe1f1 Ralph Campbell      2010-05-23   865  		 * of the PBC itself=
 is not counted.  Armed with this count,
f931551bafe1f1 Ralph Campbell      2010-05-23   866  		 * we can verify tha=
t the packet is consistent with the
f931551bafe1f1 Ralph Campbell      2010-05-23   867  		 * iovec lengths.
f931551bafe1f1 Ralph Campbell      2010-05-23   868  		 */
4668e4b527d226 CQ Tang             2013-07-19   869  		pktnw =3D le32_to_cp=
u(*pbc) & 0xFFFF;
4668e4b527d226 CQ Tang             2013-07-19   870  		if (pktnw < pktnwc) {
f931551bafe1f1 Ralph Campbell      2010-05-23   871  			ret =3D -EINVAL;
f931551bafe1f1 Ralph Campbell      2010-05-23   872  			goto free_pbc;
f931551bafe1f1 Ralph Campbell      2010-05-23   873  		}
f931551bafe1f1 Ralph Campbell      2010-05-23   874  =

f931551bafe1f1 Ralph Campbell      2010-05-23   875  		idx++;
f931551bafe1f1 Ralph Campbell      2010-05-23   876  		while (pktnwc < pktn=
w && idx < niov) {
f931551bafe1f1 Ralph Campbell      2010-05-23   877  			const size_t slen =
=3D iov[idx].iov_len;
f931551bafe1f1 Ralph Campbell      2010-05-23   878  			const unsigned long=
 faddr =3D
f931551bafe1f1 Ralph Campbell      2010-05-23   879  				(unsigned long) io=
v[idx].iov_base;
f931551bafe1f1 Ralph Campbell      2010-05-23   880  =

4668e4b527d226 CQ Tang             2013-07-19   881  			if (slen & 3 || fad=
dr & 3 || !slen) {
f931551bafe1f1 Ralph Campbell      2010-05-23   882  				ret =3D -EINVAL;
f931551bafe1f1 Ralph Campbell      2010-05-23   883  				goto free_pbc;
f931551bafe1f1 Ralph Campbell      2010-05-23   884  			}
f931551bafe1f1 Ralph Campbell      2010-05-23   885  =

4668e4b527d226 CQ Tang             2013-07-19   886  			npages +=3D qib_use=
r_sdma_num_pages(&iov[idx]);
f931551bafe1f1 Ralph Campbell      2010-05-23   887  =

d39bf40e55e666 Mike Marciniszyn    2021-10-12   888  			if (check_add_overf=
low(bytes_togo, slen, &bytes_togo) ||
d39bf40e55e666 Mike Marciniszyn    2021-10-12   889  			    bytes_togo > ty=
pe_max(typeof(pkt->bytes_togo))) {
d39bf40e55e666 Mike Marciniszyn    2021-10-12   890  				ret =3D -EINVAL;
d39bf40e55e666 Mike Marciniszyn    2021-10-12   891  				goto free_pbc;
d39bf40e55e666 Mike Marciniszyn    2021-10-12   892  			}
f931551bafe1f1 Ralph Campbell      2010-05-23   893  			pktnwc +=3D slen >>=
 2;
f931551bafe1f1 Ralph Campbell      2010-05-23   894  			idx++;
f931551bafe1f1 Ralph Campbell      2010-05-23   895  			nfrags++;
f931551bafe1f1 Ralph Campbell      2010-05-23   896  		}
f931551bafe1f1 Ralph Campbell      2010-05-23   897  =

f931551bafe1f1 Ralph Campbell      2010-05-23   898  		if (pktnwc !=3D pktn=
w) {
f931551bafe1f1 Ralph Campbell      2010-05-23   899  			ret =3D -EINVAL;
f931551bafe1f1 Ralph Campbell      2010-05-23   900  			goto free_pbc;
f931551bafe1f1 Ralph Campbell      2010-05-23   901  		}
f931551bafe1f1 Ralph Campbell      2010-05-23   902  =

4668e4b527d226 CQ Tang             2013-07-19   903  		frag_size =3D ((le32=
_to_cpu(*pbc))>>16) & 0xFFFF;
4668e4b527d226 CQ Tang             2013-07-19   904  		if (((frag_size ? fr=
ag_size : bytes_togo) + len) >
4668e4b527d226 CQ Tang             2013-07-19   905  						ppd->ibmaxlen) {
4668e4b527d226 CQ Tang             2013-07-19   906  			ret =3D -EINVAL;
4668e4b527d226 CQ Tang             2013-07-19   907  			goto free_pbc;
4668e4b527d226 CQ Tang             2013-07-19   908  		}
4668e4b527d226 CQ Tang             2013-07-19   909  =

4668e4b527d226 CQ Tang             2013-07-19   910  		if (frag_size) {
d39bf40e55e666 Mike Marciniszyn    2021-10-12   911  			size_t tidsmsize, n=
, pktsize, sz, addrlimit;
4668e4b527d226 CQ Tang             2013-07-19   912  =

4668e4b527d226 CQ Tang             2013-07-19   913  			n =3D npages*((2*PA=
GE_SIZE/frag_size)+1);
829ca44ecf60e9 Gustavo A. R. Silva 2019-05-29   914  			pktsize =3D struct_=
size(pkt, addr, n);
4668e4b527d226 CQ Tang             2013-07-19   915  =

4668e4b527d226 CQ Tang             2013-07-19   916  			/*
4668e4b527d226 CQ Tang             2013-07-19   917  			 * Determine if thi=
s is tid-sdma or just sdma.
4668e4b527d226 CQ Tang             2013-07-19   918  			 */
4668e4b527d226 CQ Tang             2013-07-19   919  			tiddma =3D (((le32_=
to_cpu(pbc[7])>>
4668e4b527d226 CQ Tang             2013-07-19   920  				QLOGIC_IB_I_TID_SH=
IFT)&
4668e4b527d226 CQ Tang             2013-07-19   921  				QLOGIC_IB_I_TID_MA=
SK) !=3D
4668e4b527d226 CQ Tang             2013-07-19   922  				QLOGIC_IB_I_TID_MA=
SK);
4668e4b527d226 CQ Tang             2013-07-19   923  =

4668e4b527d226 CQ Tang             2013-07-19   924  			if (tiddma)
4668e4b527d226 CQ Tang             2013-07-19   925  				tidsmsize =3D iov[=
idx].iov_len;
4668e4b527d226 CQ Tang             2013-07-19   926  			else
4668e4b527d226 CQ Tang             2013-07-19   927  				tidsmsize =3D 0;
4668e4b527d226 CQ Tang             2013-07-19   928  =

d39bf40e55e666 Mike Marciniszyn    2021-10-12   929  			if (check_add_overf=
low(pktsize, tidsmsize, &sz)) {
d39bf40e55e666 Mike Marciniszyn    2021-10-12   930  				ret =3D -EINVAL;
d39bf40e55e666 Mike Marciniszyn    2021-10-12   931  				goto free_pbc;
d39bf40e55e666 Mike Marciniszyn    2021-10-12   932  			}
d39bf40e55e666 Mike Marciniszyn    2021-10-12   933  			pkt =3D kmalloc(sz,=
 GFP_KERNEL);
4668e4b527d226 CQ Tang             2013-07-19   934  			if (!pkt) {
f931551bafe1f1 Ralph Campbell      2010-05-23   935  				ret =3D -ENOMEM;
f931551bafe1f1 Ralph Campbell      2010-05-23   936  				goto free_pbc;
f931551bafe1f1 Ralph Campbell      2010-05-23   937  			}
4668e4b527d226 CQ Tang             2013-07-19   938  			pkt->largepkt =3D 1;
4668e4b527d226 CQ Tang             2013-07-19   939  			pkt->frag_size =3D =
frag_size;
d39bf40e55e666 Mike Marciniszyn    2021-10-12   940  			if (check_add_overf=
low(n, ARRAY_SIZE(pkt->addr),
d39bf40e55e666 Mike Marciniszyn    2021-10-12   941  					       &addrlimit=
) ||
d39bf40e55e666 Mike Marciniszyn    2021-10-12   942  			    addrlimit > typ=
e_max(typeof(pkt->addrlimit))) {
d39bf40e55e666 Mike Marciniszyn    2021-10-12   943  				ret =3D -EINVAL;
d39bf40e55e666 Mike Marciniszyn    2021-10-12   944  				goto free_pbc;
d39bf40e55e666 Mike Marciniszyn    2021-10-12   945  			}
d39bf40e55e666 Mike Marciniszyn    2021-10-12   946  			pkt->addrlimit =3D =
addrlimit;
f931551bafe1f1 Ralph Campbell      2010-05-23   947  =

4668e4b527d226 CQ Tang             2013-07-19   948  			if (tiddma) {
4668e4b527d226 CQ Tang             2013-07-19   949  				char *tidsm =3D (c=
har *)pkt + pktsize;
da12c1f6857c07 Mike Marciniszyn    2015-01-16   950  =

4668e4b527d226 CQ Tang             2013-07-19   951  				cfur =3D copy_from=
_user(tidsm,
4668e4b527d226 CQ Tang             2013-07-19   952  					iov[idx].iov_base=
, tidsmsize);
4668e4b527d226 CQ Tang             2013-07-19   953  				if (cfur) {
4668e4b527d226 CQ Tang             2013-07-19   954  					ret =3D -EFAULT;
4668e4b527d226 CQ Tang             2013-07-19   955  					goto free_pkt;
4668e4b527d226 CQ Tang             2013-07-19   956  				}
4668e4b527d226 CQ Tang             2013-07-19   957  				pkt->tidsm =3D
4668e4b527d226 CQ Tang             2013-07-19   958  					(struct qib_tid_s=
ession_member *)tidsm;
4668e4b527d226 CQ Tang             2013-07-19   959  				pkt->tidsmcount =
=3D tidsmsize/
4668e4b527d226 CQ Tang             2013-07-19   960  					sizeof(struct qib=
_tid_session_member);
4668e4b527d226 CQ Tang             2013-07-19   961  				pkt->tidsmidx =3D =
0;
4668e4b527d226 CQ Tang             2013-07-19   962  				idx++;
f931551bafe1f1 Ralph Campbell      2010-05-23   963  			}
f931551bafe1f1 Ralph Campbell      2010-05-23   964  =

4668e4b527d226 CQ Tang             2013-07-19   965  			/*
4668e4b527d226 CQ Tang             2013-07-19   966  			 * pbc 'fill1' fiel=
d is borrowed to pass frag size,
4668e4b527d226 CQ Tang             2013-07-19   967  			 * we need to clear=
 it after picking frag size, the
4668e4b527d226 CQ Tang             2013-07-19   968  			 * hardware require=
s this field to be zero.
4668e4b527d226 CQ Tang             2013-07-19   969  			 */
4668e4b527d226 CQ Tang             2013-07-19   970  			*pbc =3D cpu_to_le3=
2(le32_to_cpu(*pbc) & 0x0000FFFF);
4668e4b527d226 CQ Tang             2013-07-19   971  		} else {
4668e4b527d226 CQ Tang             2013-07-19   972  			pkt =3D kmem_cache_=
alloc(pq->pkt_slab, GFP_KERNEL);
4668e4b527d226 CQ Tang             2013-07-19   973  			if (!pkt) {
4668e4b527d226 CQ Tang             2013-07-19   974  				ret =3D -ENOMEM;
4668e4b527d226 CQ Tang             2013-07-19   975  				goto free_pbc;
4668e4b527d226 CQ Tang             2013-07-19   976  			}
4668e4b527d226 CQ Tang             2013-07-19   977  			pkt->largepkt =3D 0;
4668e4b527d226 CQ Tang             2013-07-19   978  			pkt->frag_size =3D =
bytes_togo;
4668e4b527d226 CQ Tang             2013-07-19   979  			pkt->addrlimit =3D =
ARRAY_SIZE(pkt->addr);
4668e4b527d226 CQ Tang             2013-07-19   980  		}
4668e4b527d226 CQ Tang             2013-07-19   981  		pkt->bytes_togo =3D =
bytes_togo;
4668e4b527d226 CQ Tang             2013-07-19   982  		pkt->payload_size =
=3D 0;
4668e4b527d226 CQ Tang             2013-07-19   983  		pkt->counter =3D cou=
nter;
4668e4b527d226 CQ Tang             2013-07-19   984  		pkt->tiddma =3D tidd=
ma;
4668e4b527d226 CQ Tang             2013-07-19   985  =

4668e4b527d226 CQ Tang             2013-07-19   986  		/* setup the first h=
eader */
4668e4b527d226 CQ Tang             2013-07-19   987  		qib_user_sdma_init_f=
rag(pkt, 0, /* index */
4668e4b527d226 CQ Tang             2013-07-19   988  			0, len,		/* offset,=
 len */
4668e4b527d226 CQ Tang             2013-07-19   989  			1, 0,		/* first las=
t desc */
4668e4b527d226 CQ Tang             2013-07-19   990  			0, 0,		/* put page,=
 dma mapped */
4668e4b527d226 CQ Tang             2013-07-19   991  			NULL, pbc,	/* struc=
t page, virt addr */
4668e4b527d226 CQ Tang             2013-07-19   992  			dma_addr, len);	/* =
dma addr, dma length */
4668e4b527d226 CQ Tang             2013-07-19   993  		pkt->index =3D 0;
4668e4b527d226 CQ Tang             2013-07-19   994  		pkt->naddr =3D 1;
f931551bafe1f1 Ralph Campbell      2010-05-23   995  =

f931551bafe1f1 Ralph Campbell      2010-05-23   996  		if (nfrags) {
f931551bafe1f1 Ralph Campbell      2010-05-23   997  			ret =3D qib_user_sd=
ma_init_payload(dd, pq, pkt,
f931551bafe1f1 Ralph Campbell      2010-05-23   998  							 iov + idx_save=
 + 1,
f931551bafe1f1 Ralph Campbell      2010-05-23   999  							 nfrags, npages=
);
f931551bafe1f1 Ralph Campbell      2010-05-23  1000  			if (ret < 0)
4668e4b527d226 CQ Tang             2013-07-19  1001  				goto free_pkt;
4668e4b527d226 CQ Tang             2013-07-19  1002  		} else {
4668e4b527d226 CQ Tang             2013-07-19  1003  			/* since there is n=
o payload, mark the
4668e4b527d226 CQ Tang             2013-07-19  1004  			 * header as the la=
st desc. */
4668e4b527d226 CQ Tang             2013-07-19  1005  			pkt->addr[0].last_d=
esc =3D 1;
4668e4b527d226 CQ Tang             2013-07-19  1006  =

4668e4b527d226 CQ Tang             2013-07-19  1007  			if (dma_addr =3D=3D=
 0) {
4668e4b527d226 CQ Tang             2013-07-19  1008  				/*
4668e4b527d226 CQ Tang             2013-07-19  1009  				 * the header is n=
ot dma mapped yet.
4668e4b527d226 CQ Tang             2013-07-19  1010  				 * it should be fr=
om kmalloc.
4668e4b527d226 CQ Tang             2013-07-19  1011  				 */
4668e4b527d226 CQ Tang             2013-07-19  1012  				dma_addr =3D dma_m=
ap_single(&dd->pcidev->dev,
4668e4b527d226 CQ Tang             2013-07-19  1013  					pbc, len, DMA_TO_=
DEVICE);
4668e4b527d226 CQ Tang             2013-07-19  1014  				if (dma_mapping_er=
ror(&dd->pcidev->dev,
4668e4b527d226 CQ Tang             2013-07-19  1015  								dma_addr)) {
4668e4b527d226 CQ Tang             2013-07-19  1016  					ret =3D -ENOMEM;
4668e4b527d226 CQ Tang             2013-07-19  1017  					goto free_pkt;
4668e4b527d226 CQ Tang             2013-07-19  1018  				}
4668e4b527d226 CQ Tang             2013-07-19  1019  				pkt->addr[0].addr =
=3D dma_addr;
4668e4b527d226 CQ Tang             2013-07-19  1020  				pkt->addr[0].dma_m=
apped =3D 1;
4668e4b527d226 CQ Tang             2013-07-19  1021  			}
f931551bafe1f1 Ralph Campbell      2010-05-23  1022  		}
f931551bafe1f1 Ralph Campbell      2010-05-23  1023  =

f931551bafe1f1 Ralph Campbell      2010-05-23  1024  		counter++;
f931551bafe1f1 Ralph Campbell      2010-05-23  1025  		npkts++;
4668e4b527d226 CQ Tang             2013-07-19  1026  		pkt->pq =3D pq;
4668e4b527d226 CQ Tang             2013-07-19  1027  		pkt->index =3D 0; /*=
 reset index for push on hw */
4668e4b527d226 CQ Tang             2013-07-19  1028  		*ndesc +=3D pkt->nad=
dr;
f931551bafe1f1 Ralph Campbell      2010-05-23  1029  =

f931551bafe1f1 Ralph Campbell      2010-05-23  1030  		list_add_tail(&pkt->=
list, list);
f931551bafe1f1 Ralph Campbell      2010-05-23  1031  	}
f931551bafe1f1 Ralph Campbell      2010-05-23  1032  =

4668e4b527d226 CQ Tang             2013-07-19  1033  	*maxpkts =3D npkts;
f931551bafe1f1 Ralph Campbell      2010-05-23  1034  	ret =3D idx;
f931551bafe1f1 Ralph Campbell      2010-05-23  1035  	goto done;
f931551bafe1f1 Ralph Campbell      2010-05-23  1036  =

f931551bafe1f1 Ralph Campbell      2010-05-23  1037  free_pkt:
4668e4b527d226 CQ Tang             2013-07-19  1038  	if (pkt->largepkt)
4668e4b527d226 CQ Tang             2013-07-19  1039  		kfree(pkt);
4668e4b527d226 CQ Tang             2013-07-19  1040  	else
f931551bafe1f1 Ralph Campbell      2010-05-23  1041  		kmem_cache_free(pq->=
pkt_slab, pkt);
4668e4b527d226 CQ Tang             2013-07-19  1042  free_pbc:
4668e4b527d226 CQ Tang             2013-07-19  1043  	if (dma_addr)
4668e4b527d226 CQ Tang             2013-07-19  1044  		dma_pool_free(pq->he=
ader_cache, pbc, dma_addr);
4668e4b527d226 CQ Tang             2013-07-19  1045  	else
4668e4b527d226 CQ Tang             2013-07-19  1046  		kfree(pbc);
f931551bafe1f1 Ralph Campbell      2010-05-23  1047  free_list:
f931551bafe1f1 Ralph Campbell      2010-05-23  1048  	qib_user_sdma_free_pk=
t_list(&dd->pcidev->dev, pq, list);
f931551bafe1f1 Ralph Campbell      2010-05-23  1049  done:
f931551bafe1f1 Ralph Campbell      2010-05-23 @1050  	return ret;
f931551bafe1f1 Ralph Campbell      2010-05-23  1051  }
f931551bafe1f1 Ralph Campbell      2010-05-23  1052  =


:::::: The code at line 1050 was first introduced by commit
:::::: f931551bafe1f10ded7f5282e2aa162c267a2e5d IB/qib: Add new qib driver =
for QLogic PCIe InfiniBand adapters

:::::: TO: Ralph Campbell <ralph.campbell@qlogic.com>
:::::: CC: Roland Dreier <rolandd@cisco.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4372422908980823998==--

