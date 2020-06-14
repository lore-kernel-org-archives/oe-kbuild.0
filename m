Content-Type: multipart/mixed; boundary="===============3382953920678883156=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: crypto/essiv.c:604:7: warning: Variable 'err' is reassigned a value before the old one has been used.
Date: Sun, 14 Jun 2020 15:00:01 +0800
Message-ID: <202006141455.PboxauWV%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3382953920678883156==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Ard Biesheuvel <ard.biesheuvel@linaro.org>
CC: Mike Snitzer <snitzer@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   96144c58abe7ff767e754b5b80995f7b8846d49b
commit: be1eb7f78aa8fbe34779c56c266ccd0364604e71 crypto: essiv - create wra=
pper template for ESSIV generation
date:   9 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 9 months ago
compiler: gcc-9 (Debian 9.3.0-13) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> fs/ecryptfs/crypto.c:586:5: warning: Variable 'rc' is reassigned a value=
 before the old one has been used. [redundantAssignment]
    rc =3D ecryptfs_crypto_api_algify_cipher_name(&full_alg_name,
       ^
   fs/ecryptfs/crypto.c:574:0: note: Variable 'rc' is reassigned a value be=
fore the old one has been used.
    int rc =3D -EINVAL;
   ^
   fs/ecryptfs/crypto.c:586:5: note: Variable 'rc' is reassigned a value be=
fore the old one has been used.
    rc =3D ecryptfs_crypto_api_algify_cipher_name(&full_alg_name,
       ^
>> fs/ecryptfs/crypto.c:655:30: warning: Checking if unsigned variable 'cry=
pt_stat->iv_bytes' is less than zero. [unsignedLessThanZero]
    BUG_ON(crypt_stat->iv_bytes <=3D 0);
                                ^
>> fs/ecryptfs/crypto.c:355:31: warning: Local variable ecr shadows outer v=
ariable [shadowVar]
     struct extent_crypt_result *ecr =3D req->base.data;
                                 ^
   fs/ecryptfs/crypto.c:311:29: note: Shadowed declaration
    struct extent_crypt_result ecr;
                               ^
   fs/ecryptfs/crypto.c:355:31: note: Shadow variable
     struct extent_crypt_result *ecr =3D req->base.data;
                                 ^
>> fs/ubifs/replay.c:482:6: warning: Local variable key_type shadows outer =
function [shadowFunction]
    int key_type =3D key_type_flash(c, dent->key);
        ^
   fs/ubifs/key.h:323:19: note: Shadowed declaration
   static inline int key_type(const struct ubifs_info *c,
                     ^
   fs/ubifs/replay.c:482:6: note: Shadow variable
    int key_type =3D key_type_flash(c, dent->key);
        ^
>> net/bluetooth/smp.c:234:9: warning: Identical condition 'err', second co=
ndition is always false [identicalConditionAfterEarlyExit]
    return err;
           ^
   net/bluetooth/smp.c:229:6: note: first condition
    if (err)
        ^
   net/bluetooth/smp.c:234:9: note: second condition
    return err;
           ^
   net/bluetooth/smp.c:315:9: warning: Identical condition 'err', second co=
ndition is always false [identicalConditionAfterEarlyExit]
    return err;
           ^
   net/bluetooth/smp.c:310:6: note: first condition
    if (err)
        ^
   net/bluetooth/smp.c:315:9: note: second condition
    return err;
           ^
   net/bluetooth/smp.c:357:9: warning: Identical condition 'err', second co=
ndition is always false [identicalConditionAfterEarlyExit]
    return err;
           ^
   net/bluetooth/smp.c:352:6: note: first condition
    if (err)
        ^
   net/bluetooth/smp.c:357:9: note: second condition
    return err;
           ^
   net/bluetooth/smp.c:373:9: warning: Identical condition 'err', second co=
ndition is always false [identicalConditionAfterEarlyExit]
    return err;
           ^
   net/bluetooth/smp.c:368:6: note: first condition
    if (err)
        ^
   net/bluetooth/smp.c:373:9: note: second condition
    return err;
           ^
--
>> crypto/essiv.c:604:7: warning: Variable 'err' is reassigned a value befo=
re the old one has been used. [redundantAssignment]
     err =3D skcipher_register_instance(tmpl, skcipher_inst);
         ^
   crypto/essiv.c:573:6: note: Variable 'err' is reassigned a value before =
the old one has been used.
    err =3D -ENAMETOOLONG;
        ^
   crypto/essiv.c:604:7: note: Variable 'err' is reassigned a value before =
the old one has been used.
     err =3D skcipher_register_instance(tmpl, skcipher_inst);
         ^

# https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3Dbe1eb7f78aa8fbe34779c56c266ccd0364604e71
git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torval=
ds/linux.git
git remote update linus
git checkout be1eb7f78aa8fbe34779c56c266ccd0364604e71
vim +/err +604 crypto/essiv.c

be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  455  =

be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  456  static int essiv_create(stru=
ct crypto_template *tmpl, struct rtattr **tb)
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  457  {
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  458  	struct crypto_attr_type *al=
gt;
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  459  	const char *inner_cipher_na=
me;
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  460  	const char *shash_name;
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  461  	struct skcipher_instance *s=
kcipher_inst =3D NULL;
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  462  	struct aead_instance *aead_=
inst =3D NULL;
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  463  	struct crypto_instance *ins=
t;
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  464  	struct crypto_alg *base, *b=
lock_base;
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  465  	struct essiv_instance_ctx *=
ictx;
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  466  	struct skcipher_alg *skciph=
er_alg =3D NULL;
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  467  	struct aead_alg *aead_alg =
=3D NULL;
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  468  	struct crypto_alg *_hash_al=
g;
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  469  	struct shash_alg *hash_alg;
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  470  	int ivsize;
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  471  	u32 type;
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  472  	int err;
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  473  =

be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  474  	algt =3D crypto_get_attr_ty=
pe(tb);
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  475  	if (IS_ERR(algt))
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  476  		return PTR_ERR(algt);
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  477  =

be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  478  	inner_cipher_name =3D crypt=
o_attr_alg_name(tb[1]);
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  479  	if (IS_ERR(inner_cipher_nam=
e))
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  480  		return PTR_ERR(inner_ciphe=
r_name);
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  481  =

be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  482  	shash_name =3D crypto_attr_=
alg_name(tb[2]);
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  483  	if (IS_ERR(shash_name))
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  484  		return PTR_ERR(shash_name);
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  485  =

be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  486  	type =3D algt->type & algt-=
>mask;
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  487  =

be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  488  	switch (type) {
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  489  	case CRYPTO_ALG_TYPE_BLKCIP=
HER:
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  490  		skcipher_inst =3D kzalloc(=
sizeof(*skcipher_inst) +
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  491  					sizeof(*ictx), GFP_KERN=
EL);
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  492  		if (!skcipher_inst)
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  493  			return -ENOMEM;
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  494  		inst =3D skcipher_crypto_i=
nstance(skcipher_inst);
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  495  		base =3D &skcipher_inst->a=
lg.base;
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  496  		ictx =3D crypto_instance_c=
tx(inst);
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  497  =

be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  498  		/* Symmetric cipher, e.g.,=
 "cbc(aes)" */
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  499  		crypto_set_skcipher_spawn(=
&ictx->u.skcipher_spawn, inst);
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  500  		err =3D crypto_grab_skciph=
er(&ictx->u.skcipher_spawn,
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  501  					   inner_cipher_name, 0,
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  502  					   crypto_requires_sync=
(algt->type,
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  503  								algt->mask));
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  504  		if (err)
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  505  			goto out_free_inst;
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  506  		skcipher_alg =3D crypto_sp=
awn_skcipher_alg(&ictx->u.skcipher_spawn);
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  507  		block_base =3D &skcipher_a=
lg->base;
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  508  		ivsize =3D crypto_skcipher=
_alg_ivsize(skcipher_alg);
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  509  		break;
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  510  =

be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  511  	case CRYPTO_ALG_TYPE_AEAD:
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  512  		aead_inst =3D kzalloc(size=
of(*aead_inst) +
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  513  				    sizeof(*ictx), GFP_K=
ERNEL);
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  514  		if (!aead_inst)
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  515  			return -ENOMEM;
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  516  		inst =3D aead_crypto_insta=
nce(aead_inst);
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  517  		base =3D &aead_inst->alg.b=
ase;
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  518  		ictx =3D crypto_instance_c=
tx(inst);
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  519  =

be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  520  		/* AEAD cipher, e.g., "aut=
henc(hmac(sha256),cbc(aes))" */
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  521  		crypto_set_aead_spawn(&ict=
x->u.aead_spawn, inst);
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  522  		err =3D crypto_grab_aead(&=
ictx->u.aead_spawn,
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  523  				       inner_cipher_name=
, 0,
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  524  				       crypto_requires_s=
ync(algt->type,
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  525  							    algt->mask));
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  526  		if (err)
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  527  			goto out_free_inst;
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  528  		aead_alg =3D crypto_spawn_=
aead_alg(&ictx->u.aead_spawn);
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  529  		block_base =3D &aead_alg->=
base;
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  530  		if (!strstarts(block_base-=
>cra_name, "authenc(")) {
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  531  			pr_warn("Only authenc() t=
ype AEADs are supported by ESSIV\n");
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  532  			err =3D -EINVAL;
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  533  			goto out_drop_skcipher;
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  534  		}
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  535  		ivsize =3D aead_alg->ivsiz=
e;
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  536  		break;
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  537  =

be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  538  	default:
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  539  		return -EINVAL;
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  540  	}
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  541  =

be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  542  	if (!parse_cipher_name(ictx=
->essiv_cipher_name, block_base->cra_name)) {
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  543  		pr_warn("Failed to parse E=
SSIV cipher name from skcipher cra_name\n");
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  544  		err =3D -EINVAL;
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  545  		goto out_drop_skcipher;
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  546  	}
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  547  =

be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  548  	/* Synchronous hash, e.g., =
"sha256" */
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  549  	_hash_alg =3D crypto_alg_mo=
d_lookup(shash_name,
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  550  					  CRYPTO_ALG_TYPE_SHASH,
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  551  					  CRYPTO_ALG_TYPE_MASK);
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  552  	if (IS_ERR(_hash_alg)) {
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  553  		err =3D PTR_ERR(_hash_alg);
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  554  		goto out_drop_skcipher;
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  555  	}
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  556  	hash_alg =3D __crypto_shash=
_alg(_hash_alg);
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  557  =

be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  558  	/* Check the set of algorit=
hms */
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  559  	if (!essiv_supported_algori=
thms(ictx->essiv_cipher_name, hash_alg,
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  560  					ivsize)) {
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  561  		pr_warn("Unsupported essiv=
 instantiation: essiv(%s,%s)\n",
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  562  			block_base->cra_name, has=
h_alg->base.cra_name);
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  563  		err =3D -EINVAL;
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  564  		goto out_free_hash;
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  565  	}
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  566  =

be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  567  	/* record the driver name s=
o we can instantiate this exact algo later */
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  568  	strlcpy(ictx->shash_driver_=
name, hash_alg->base.cra_driver_name,
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  569  		CRYPTO_MAX_ALG_NAME);
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  570  =

be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  571  	/* Instance fields */
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  572  =

be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  573  	err =3D -ENAMETOOLONG;
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  574  	if (snprintf(base->cra_name=
, CRYPTO_MAX_ALG_NAME,
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  575  		     "essiv(%s,%s)", block=
_base->cra_name,
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  576  		     hash_alg->base.cra_na=
me) >=3D CRYPTO_MAX_ALG_NAME)
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  577  		goto out_free_hash;
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  578  	if (snprintf(base->cra_driv=
er_name, CRYPTO_MAX_ALG_NAME,
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  579  		     "essiv(%s,%s)", block=
_base->cra_driver_name,
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  580  		     hash_alg->base.cra_dr=
iver_name) >=3D CRYPTO_MAX_ALG_NAME)
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  581  		goto out_free_hash;
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  582  =

be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  583  	base->cra_flags		=3D block_=
base->cra_flags & CRYPTO_ALG_ASYNC;
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  584  	base->cra_blocksize	=3D blo=
ck_base->cra_blocksize;
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  585  	base->cra_ctxsize	=3D sizeo=
f(struct essiv_tfm_ctx);
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  586  	base->cra_alignmask	=3D blo=
ck_base->cra_alignmask;
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  587  	base->cra_priority	=3D bloc=
k_base->cra_priority;
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  588  =

be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  589  	if (type =3D=3D CRYPTO_ALG_=
TYPE_BLKCIPHER) {
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  590  		skcipher_inst->alg.setkey	=
=3D essiv_skcipher_setkey;
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  591  		skcipher_inst->alg.encrypt=
	=3D essiv_skcipher_encrypt;
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  592  		skcipher_inst->alg.decrypt=
	=3D essiv_skcipher_decrypt;
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  593  		skcipher_inst->alg.init		=
=3D essiv_skcipher_init_tfm;
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  594  		skcipher_inst->alg.exit		=
=3D essiv_skcipher_exit_tfm;
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  595  =

be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  596  		skcipher_inst->alg.min_key=
size	=3D crypto_skcipher_alg_min_keysize(skcipher_alg);
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  597  		skcipher_inst->alg.max_key=
size	=3D crypto_skcipher_alg_max_keysize(skcipher_alg);
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  598  		skcipher_inst->alg.ivsize	=
=3D ivsize;
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  599  		skcipher_inst->alg.chunksi=
ze	=3D crypto_skcipher_alg_chunksize(skcipher_alg);
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  600  		skcipher_inst->alg.walksiz=
e	=3D crypto_skcipher_alg_walksize(skcipher_alg);
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  601  =

be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  602  		skcipher_inst->free		=3D e=
ssiv_skcipher_free_instance;
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  603  =

be1eb7f78aa8fb Ard Biesheuvel 2019-08-19 @604  		err =3D skcipher_register_=
instance(tmpl, skcipher_inst);
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  605  	} else {
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  606  		aead_inst->alg.setkey		=3D=
 essiv_aead_setkey;
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  607  		aead_inst->alg.setauthsize=
	=3D essiv_aead_setauthsize;
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  608  		aead_inst->alg.encrypt		=
=3D essiv_aead_encrypt;
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  609  		aead_inst->alg.decrypt		=
=3D essiv_aead_decrypt;
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  610  		aead_inst->alg.init		=3D e=
ssiv_aead_init_tfm;
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  611  		aead_inst->alg.exit		=3D e=
ssiv_aead_exit_tfm;
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  612  =

be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  613  		aead_inst->alg.ivsize		=3D=
 ivsize;
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  614  		aead_inst->alg.maxauthsize=
	=3D crypto_aead_alg_maxauthsize(aead_alg);
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  615  		aead_inst->alg.chunksize	=
=3D crypto_aead_alg_chunksize(aead_alg);
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  616  =

be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  617  		aead_inst->free			=3D essi=
v_aead_free_instance;
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  618  =

be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  619  		err =3D aead_register_inst=
ance(tmpl, aead_inst);
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  620  	}
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  621  =

be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  622  	if (err)
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  623  		goto out_free_hash;
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  624  =

be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  625  	crypto_mod_put(_hash_alg);
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  626  	return 0;
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  627  =

be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  628  out_free_hash:
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  629  	crypto_mod_put(_hash_alg);
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  630  out_drop_skcipher:
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  631  	if (type =3D=3D CRYPTO_ALG_=
TYPE_BLKCIPHER)
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  632  		crypto_drop_skcipher(&ictx=
->u.skcipher_spawn);
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  633  	else
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  634  		crypto_drop_aead(&ictx->u.=
aead_spawn);
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  635  out_free_inst:
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  636  	kfree(skcipher_inst);
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  637  	kfree(aead_inst);
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  638  	return err;
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  639  }
be1eb7f78aa8fb Ard Biesheuvel 2019-08-19  640  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3382953920678883156==--

