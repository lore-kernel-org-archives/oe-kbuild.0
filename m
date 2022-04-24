Content-Type: multipart/mixed; boundary="===============0895394186173512872=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v4 2/5] virtio-crypto: use private buffer for control request
Date: Sun, 24 Apr 2022 23:51:49 +0800
Message-ID: <202204242344.JepUMdzP-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0895394186173512872==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220424104140.44841-3-pizhenwei@bytedance.com>
References: <20220424104140.44841-3-pizhenwei@bytedance.com>
TO: zhenwei pi <pizhenwei@bytedance.com>
TO: arei.gonglei(a)huawei.com
TO: mst(a)redhat.com
TO: jasowang(a)redhat.com
CC: herbert(a)gondor.apana.org.au
CC: linux-kernel(a)vger.kernel.org
CC: virtualization(a)lists.linux-foundation.org
CC: linux-crypto(a)vger.kernel.org
CC: helei.sig11(a)bytedance.com
CC: davem(a)davemloft.net
CC: zhenwei pi <pizhenwei@bytedance.com>

Hi zhenwei,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on herbert-cryptodev-2.6/master]
[also build test WARNING on linus/master v5.18-rc3 next-20220422]
[cannot apply to herbert-crypto-2.6/master linux/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/zhenwei-pi/virtio-cr=
ypto-Improve-performance/20220424-184732
base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2=
.6.git master
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20220=
424/202204242344.JepUMdzP-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:165 virtio_crypto_alg_a=
kcipher_init_session() error: potentially dereferencing uninitialized 'inpu=
t'.
drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:230 virtio_crypto_alg_a=
kcipher_close_session() error: uninitialized symbol 'vc_ctrl_req'.
drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:232 virtio_crypto_alg_a=
kcipher_close_session() error: potentially dereferencing uninitialized 'ctr=
l_status'.
drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:232 virtio_crypto_alg_a=
kcipher_close_session() error: potentially dereferencing uninitialized 'des=
troy_session'.

vim +/input +165 drivers/crypto/virtio/virtio_crypto_akcipher_algs.c

59ca6c93387d32 zhenwei pi 2022-03-02   98  =

59ca6c93387d32 zhenwei pi 2022-03-02   99  static int virtio_crypto_alg_akc=
ipher_init_session(struct virtio_crypto_akcipher_ctx *ctx,
59ca6c93387d32 zhenwei pi 2022-03-02  100  		struct virtio_crypto_ctrl_head=
er *header, void *para,
59ca6c93387d32 zhenwei pi 2022-03-02  101  		const uint8_t *key, unsigned i=
nt keylen)
59ca6c93387d32 zhenwei pi 2022-03-02  102  {
59ca6c93387d32 zhenwei pi 2022-03-02  103  	struct scatterlist outhdr_sg, k=
ey_sg, inhdr_sg, *sgs[3];
59ca6c93387d32 zhenwei pi 2022-03-02  104  	struct virtio_crypto *vcrypto =
=3D ctx->vcrypto;
59ca6c93387d32 zhenwei pi 2022-03-02  105  	uint8_t *pkey;
59ca6c93387d32 zhenwei pi 2022-03-02  106  	unsigned int inlen;
59ca6c93387d32 zhenwei pi 2022-03-02  107  	int err;
59ca6c93387d32 zhenwei pi 2022-03-02  108  	unsigned int num_out =3D 0, num=
_in =3D 0;
bb26cab9a7c25d zhenwei pi 2022-04-24  109  	struct virtio_crypto_op_ctrl_re=
q *ctrl;
bb26cab9a7c25d zhenwei pi 2022-04-24  110  	struct virtio_crypto_session_in=
put *input;
286da9ed04239c zhenwei pi 2022-04-24  111  	struct virtio_crypto_ctrl_reque=
st *vc_ctrl_req;
59ca6c93387d32 zhenwei pi 2022-03-02  112  =

59ca6c93387d32 zhenwei pi 2022-03-02  113  	pkey =3D kmemdup(key, keylen, G=
FP_ATOMIC);
59ca6c93387d32 zhenwei pi 2022-03-02  114  	if (!pkey)
59ca6c93387d32 zhenwei pi 2022-03-02  115  		return -ENOMEM;
59ca6c93387d32 zhenwei pi 2022-03-02  116  =

286da9ed04239c zhenwei pi 2022-04-24  117  	vc_ctrl_req =3D kzalloc(sizeof(=
*vc_ctrl_req), GFP_KERNEL);
286da9ed04239c zhenwei pi 2022-04-24  118  	if (!vc_ctrl_req) {
286da9ed04239c zhenwei pi 2022-04-24  119  		err =3D -ENOMEM;
286da9ed04239c zhenwei pi 2022-04-24  120  		goto out;
286da9ed04239c zhenwei pi 2022-04-24  121  	}
286da9ed04239c zhenwei pi 2022-04-24  122  =

286da9ed04239c zhenwei pi 2022-04-24  123  	ctrl =3D &vc_ctrl_req->ctrl;
bb26cab9a7c25d zhenwei pi 2022-04-24  124  	memcpy(&ctrl->header, header, s=
izeof(ctrl->header));
bb26cab9a7c25d zhenwei pi 2022-04-24  125  	memcpy(&ctrl->u, para, sizeof(c=
trl->u));
286da9ed04239c zhenwei pi 2022-04-24  126  	input =3D &vc_ctrl_req->input;
bb26cab9a7c25d zhenwei pi 2022-04-24  127  	input->status =3D cpu_to_le32(V=
IRTIO_CRYPTO_ERR);
59ca6c93387d32 zhenwei pi 2022-03-02  128  =

bb26cab9a7c25d zhenwei pi 2022-04-24  129  	sg_init_one(&outhdr_sg, ctrl, s=
izeof(*ctrl));
59ca6c93387d32 zhenwei pi 2022-03-02  130  	sgs[num_out++] =3D &outhdr_sg;
59ca6c93387d32 zhenwei pi 2022-03-02  131  =

59ca6c93387d32 zhenwei pi 2022-03-02  132  	sg_init_one(&key_sg, pkey, keyl=
en);
59ca6c93387d32 zhenwei pi 2022-03-02  133  	sgs[num_out++] =3D &key_sg;
59ca6c93387d32 zhenwei pi 2022-03-02  134  =

bb26cab9a7c25d zhenwei pi 2022-04-24  135  	sg_init_one(&inhdr_sg, input, s=
izeof(*input));
59ca6c93387d32 zhenwei pi 2022-03-02  136  	sgs[num_out + num_in++] =3D &in=
hdr_sg;
59ca6c93387d32 zhenwei pi 2022-03-02  137  =

286da9ed04239c zhenwei pi 2022-04-24  138  	spin_lock(&vcrypto->ctrl_lock);
59ca6c93387d32 zhenwei pi 2022-03-02  139  	err =3D virtqueue_add_sgs(vcryp=
to->ctrl_vq, sgs, num_out, num_in, vcrypto, GFP_ATOMIC);
286da9ed04239c zhenwei pi 2022-04-24  140  	if (err < 0) {
286da9ed04239c zhenwei pi 2022-04-24  141  		spin_unlock(&vcrypto->ctrl_loc=
k);
59ca6c93387d32 zhenwei pi 2022-03-02  142  		goto out;
286da9ed04239c zhenwei pi 2022-04-24  143  	}
59ca6c93387d32 zhenwei pi 2022-03-02  144  =

59ca6c93387d32 zhenwei pi 2022-03-02  145  	virtqueue_kick(vcrypto->ctrl_vq=
);
59ca6c93387d32 zhenwei pi 2022-03-02  146  	while (!virtqueue_get_buf(vcryp=
to->ctrl_vq, &inlen) &&
59ca6c93387d32 zhenwei pi 2022-03-02  147  	       !virtqueue_is_broken(vcr=
ypto->ctrl_vq))
59ca6c93387d32 zhenwei pi 2022-03-02  148  		cpu_relax();
286da9ed04239c zhenwei pi 2022-04-24  149  	spin_unlock(&vcrypto->ctrl_lock=
);
59ca6c93387d32 zhenwei pi 2022-03-02  150  =

bb26cab9a7c25d zhenwei pi 2022-04-24  151  	if (le32_to_cpu(input->status) =
!=3D VIRTIO_CRYPTO_OK) {
59ca6c93387d32 zhenwei pi 2022-03-02  152  		err =3D -EINVAL;
59ca6c93387d32 zhenwei pi 2022-03-02  153  		goto out;
59ca6c93387d32 zhenwei pi 2022-03-02  154  	}
59ca6c93387d32 zhenwei pi 2022-03-02  155  =

bb26cab9a7c25d zhenwei pi 2022-04-24  156  	ctx->session_id =3D le64_to_cpu=
(input->session_id);
59ca6c93387d32 zhenwei pi 2022-03-02  157  	ctx->session_valid =3D true;
59ca6c93387d32 zhenwei pi 2022-03-02  158  	err =3D 0;
59ca6c93387d32 zhenwei pi 2022-03-02  159  =

59ca6c93387d32 zhenwei pi 2022-03-02  160  out:
286da9ed04239c zhenwei pi 2022-04-24  161  	kfree(vc_ctrl_req);
59ca6c93387d32 zhenwei pi 2022-03-02  162  	kfree_sensitive(pkey);
59ca6c93387d32 zhenwei pi 2022-03-02  163  =

59ca6c93387d32 zhenwei pi 2022-03-02  164  	if (err < 0)
59ca6c93387d32 zhenwei pi 2022-03-02 @165  		pr_err("virtio_crypto: Create =
session failed status: %u\n",
bb26cab9a7c25d zhenwei pi 2022-04-24  166  			le32_to_cpu(input->status));
59ca6c93387d32 zhenwei pi 2022-03-02  167  =

59ca6c93387d32 zhenwei pi 2022-03-02  168  	return err;
59ca6c93387d32 zhenwei pi 2022-03-02  169  }
59ca6c93387d32 zhenwei pi 2022-03-02  170  =

59ca6c93387d32 zhenwei pi 2022-03-02  171  static int virtio_crypto_alg_akc=
ipher_close_session(struct virtio_crypto_akcipher_ctx *ctx)
59ca6c93387d32 zhenwei pi 2022-03-02  172  {
59ca6c93387d32 zhenwei pi 2022-03-02  173  	struct scatterlist outhdr_sg, i=
nhdr_sg, *sgs[2];
59ca6c93387d32 zhenwei pi 2022-03-02  174  	struct virtio_crypto_destroy_se=
ssion_req *destroy_session;
59ca6c93387d32 zhenwei pi 2022-03-02  175  	struct virtio_crypto *vcrypto =
=3D ctx->vcrypto;
59ca6c93387d32 zhenwei pi 2022-03-02  176  	unsigned int num_out =3D 0, num=
_in =3D 0, inlen;
59ca6c93387d32 zhenwei pi 2022-03-02  177  	int err;
bb26cab9a7c25d zhenwei pi 2022-04-24  178  	struct virtio_crypto_op_ctrl_re=
q *ctrl;
bb26cab9a7c25d zhenwei pi 2022-04-24  179  	struct virtio_crypto_inhdr *ctr=
l_status;
286da9ed04239c zhenwei pi 2022-04-24  180  	struct virtio_crypto_ctrl_reque=
st *vc_ctrl_req;
59ca6c93387d32 zhenwei pi 2022-03-02  181  =

59ca6c93387d32 zhenwei pi 2022-03-02  182  	if (!ctx->session_valid) {
59ca6c93387d32 zhenwei pi 2022-03-02  183  		err =3D 0;
59ca6c93387d32 zhenwei pi 2022-03-02  184  		goto out;
59ca6c93387d32 zhenwei pi 2022-03-02  185  	}
286da9ed04239c zhenwei pi 2022-04-24  186  =

286da9ed04239c zhenwei pi 2022-04-24  187  	vc_ctrl_req =3D kzalloc(sizeof(=
*vc_ctrl_req), GFP_KERNEL);
286da9ed04239c zhenwei pi 2022-04-24  188  	if (!vc_ctrl_req) {
286da9ed04239c zhenwei pi 2022-04-24  189  		err =3D -ENOMEM;
286da9ed04239c zhenwei pi 2022-04-24  190  		goto out;
286da9ed04239c zhenwei pi 2022-04-24  191  	}
286da9ed04239c zhenwei pi 2022-04-24  192  =

286da9ed04239c zhenwei pi 2022-04-24  193  	ctrl_status =3D &vc_ctrl_req->c=
trl_status;
bb26cab9a7c25d zhenwei pi 2022-04-24  194  	ctrl_status->status =3D VIRTIO_=
CRYPTO_ERR;
286da9ed04239c zhenwei pi 2022-04-24  195  	ctrl =3D &vc_ctrl_req->ctrl;
bb26cab9a7c25d zhenwei pi 2022-04-24  196  	ctrl->header.opcode =3D cpu_to_=
le32(VIRTIO_CRYPTO_AKCIPHER_DESTROY_SESSION);
bb26cab9a7c25d zhenwei pi 2022-04-24  197  	ctrl->header.queue_id =3D 0;
59ca6c93387d32 zhenwei pi 2022-03-02  198  =

bb26cab9a7c25d zhenwei pi 2022-04-24  199  	destroy_session =3D &ctrl->u.de=
stroy_session;
59ca6c93387d32 zhenwei pi 2022-03-02  200  	destroy_session->session_id =3D=
 cpu_to_le64(ctx->session_id);
59ca6c93387d32 zhenwei pi 2022-03-02  201  =

bb26cab9a7c25d zhenwei pi 2022-04-24  202  	sg_init_one(&outhdr_sg, ctrl, s=
izeof(*ctrl));
59ca6c93387d32 zhenwei pi 2022-03-02  203  	sgs[num_out++] =3D &outhdr_sg;
59ca6c93387d32 zhenwei pi 2022-03-02  204  =

bb26cab9a7c25d zhenwei pi 2022-04-24  205  	sg_init_one(&inhdr_sg, &ctrl_st=
atus->status, sizeof(ctrl_status->status));
59ca6c93387d32 zhenwei pi 2022-03-02  206  	sgs[num_out + num_in++] =3D &in=
hdr_sg;
59ca6c93387d32 zhenwei pi 2022-03-02  207  =

286da9ed04239c zhenwei pi 2022-04-24  208  	spin_lock(&vcrypto->ctrl_lock);
59ca6c93387d32 zhenwei pi 2022-03-02  209  	err =3D virtqueue_add_sgs(vcryp=
to->ctrl_vq, sgs, num_out, num_in, vcrypto, GFP_ATOMIC);
286da9ed04239c zhenwei pi 2022-04-24  210  	if (err < 0) {
286da9ed04239c zhenwei pi 2022-04-24  211  		spin_unlock(&vcrypto->ctrl_loc=
k);
59ca6c93387d32 zhenwei pi 2022-03-02  212  		goto out;
286da9ed04239c zhenwei pi 2022-04-24  213  	}
59ca6c93387d32 zhenwei pi 2022-03-02  214  =

59ca6c93387d32 zhenwei pi 2022-03-02  215  	virtqueue_kick(vcrypto->ctrl_vq=
);
59ca6c93387d32 zhenwei pi 2022-03-02  216  	while (!virtqueue_get_buf(vcryp=
to->ctrl_vq, &inlen) &&
59ca6c93387d32 zhenwei pi 2022-03-02  217  	       !virtqueue_is_broken(vcr=
ypto->ctrl_vq))
59ca6c93387d32 zhenwei pi 2022-03-02  218  		cpu_relax();
286da9ed04239c zhenwei pi 2022-04-24  219  	spin_unlock(&vcrypto->ctrl_lock=
);
59ca6c93387d32 zhenwei pi 2022-03-02  220  =

bb26cab9a7c25d zhenwei pi 2022-04-24  221  	if (ctrl_status->status !=3D VI=
RTIO_CRYPTO_OK) {
59ca6c93387d32 zhenwei pi 2022-03-02  222  		err =3D -EINVAL;
59ca6c93387d32 zhenwei pi 2022-03-02  223  		goto out;
59ca6c93387d32 zhenwei pi 2022-03-02  224  	}
59ca6c93387d32 zhenwei pi 2022-03-02  225  =

59ca6c93387d32 zhenwei pi 2022-03-02  226  	err =3D 0;
59ca6c93387d32 zhenwei pi 2022-03-02  227  	ctx->session_valid =3D false;
59ca6c93387d32 zhenwei pi 2022-03-02  228  =

59ca6c93387d32 zhenwei pi 2022-03-02  229  out:
286da9ed04239c zhenwei pi 2022-04-24 @230  	kfree(vc_ctrl_req);
59ca6c93387d32 zhenwei pi 2022-03-02  231  	if (err < 0) {
59ca6c93387d32 zhenwei pi 2022-03-02 @232  		pr_err("virtio_crypto: Close s=
ession failed status: %u, session_id: 0x%llx\n",
bb26cab9a7c25d zhenwei pi 2022-04-24  233  			ctrl_status->status, destroy_=
session->session_id);
59ca6c93387d32 zhenwei pi 2022-03-02  234  	}
59ca6c93387d32 zhenwei pi 2022-03-02  235  =

59ca6c93387d32 zhenwei pi 2022-03-02  236  	return err;
59ca6c93387d32 zhenwei pi 2022-03-02  237  }
59ca6c93387d32 zhenwei pi 2022-03-02  238  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0895394186173512872==--

