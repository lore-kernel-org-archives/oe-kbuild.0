Content-Type: multipart/mixed; boundary="===============6935199306363641854=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ebiggers:cryptobench 1/1] crypto/benchmark.c:444:27: warning: Parameter 'off' can be declared with const [constParameter]
Date: Thu, 09 Jun 2022 06:53:09 +0800
Message-ID: <202206090631.7HkJjbEw-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6935199306363641854==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: crypto/be=
nchmark.c:444:27: warning: Parameter 'off' can be declared with const [cons=
tParameter]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Eric Biggers <ebiggers@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git =
cryptobench
head:   d8c93cbf8d7da95989a79fcad5855bdb01070033
commit: d8c93cbf8d7da95989a79fcad5855bdb01070033 [1/1] [TESTING, DO NOT MER=
GE] crypto - add benchmark and testing module
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
compiler: alpha-linux-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout d8c93cbf8d7da95989a79fcad5855bdb01070033
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> crypto/benchmark.c:444:27: warning: Parameter 'off' can be declared with=
 const [constParameter]
        size_t size, loff_t *off)
                             ^

vim +/off +444 crypto/benchmark.c

d8c93cbf8d7da9 Eric Biggers 2022-05-02  442  =

d8c93cbf8d7da9 Eric Biggers 2022-05-02  443  static ssize_t cryptobench_wri=
te(struct file *f, const char __user *ubuf,
d8c93cbf8d7da9 Eric Biggers 2022-05-02 @444  				 size_t size, loff_t *off)
d8c93cbf8d7da9 Eric Biggers 2022-05-02  445  {
d8c93cbf8d7da9 Eric Biggers 2022-05-02  446  	char *optstr =3D NULL;
d8c93cbf8d7da9 Eric Biggers 2022-05-02  447  	char *opt, *optp;
d8c93cbf8d7da9 Eric Biggers 2022-05-02  448  	struct cryptobench_params par=
ams =3D {
d8c93cbf8d7da9 Eric Biggers 2022-05-02  449  		.algtype =3D "skcipher",
d8c93cbf8d7da9 Eric Biggers 2022-05-02  450  		.niter =3D 4096,
d8c93cbf8d7da9 Eric Biggers 2022-05-02  451  		.bufsize =3D 4096,
d8c93cbf8d7da9 Eric Biggers 2022-05-02  452  	};
d8c93cbf8d7da9 Eric Biggers 2022-05-02  453  	ssize_t ret;
d8c93cbf8d7da9 Eric Biggers 2022-05-02  454  	int i;
d8c93cbf8d7da9 Eric Biggers 2022-05-02  455  	enum cryptobench_result resul=
t;
d8c93cbf8d7da9 Eric Biggers 2022-05-02  456  =

d8c93cbf8d7da9 Eric Biggers 2022-05-02  457  	mutex_lock(&cryptobench_mutex=
);
d8c93cbf8d7da9 Eric Biggers 2022-05-02  458  =

d8c93cbf8d7da9 Eric Biggers 2022-05-02  459  	if (size >=3D 4096 || *off !=
=3D 0)
d8c93cbf8d7da9 Eric Biggers 2022-05-02  460  		goto bad_params;
d8c93cbf8d7da9 Eric Biggers 2022-05-02  461  =

d8c93cbf8d7da9 Eric Biggers 2022-05-02  462  	optstr =3D kmalloc(size + 1, =
GFP_KERNEL);
d8c93cbf8d7da9 Eric Biggers 2022-05-02  463  	if (!optstr)
d8c93cbf8d7da9 Eric Biggers 2022-05-02  464  		goto bad_params;
d8c93cbf8d7da9 Eric Biggers 2022-05-02  465  	if (copy_from_user(optstr, ub=
uf, size))
d8c93cbf8d7da9 Eric Biggers 2022-05-02  466  		goto bad_params;
d8c93cbf8d7da9 Eric Biggers 2022-05-02  467  	optstr[size] =3D '\0';
d8c93cbf8d7da9 Eric Biggers 2022-05-02  468  =

d8c93cbf8d7da9 Eric Biggers 2022-05-02  469  	optp =3D optstr;
d8c93cbf8d7da9 Eric Biggers 2022-05-02  470  	while ((opt =3D strsep(&optp,=
 "\n ")) !=3D NULL) {
d8c93cbf8d7da9 Eric Biggers 2022-05-02  471  		substring_t args[MAX_OPT_ARG=
S];
d8c93cbf8d7da9 Eric Biggers 2022-05-02  472  		int token;
d8c93cbf8d7da9 Eric Biggers 2022-05-02  473  =

d8c93cbf8d7da9 Eric Biggers 2022-05-02  474  		if (!*opt)
d8c93cbf8d7da9 Eric Biggers 2022-05-02  475  			continue;
d8c93cbf8d7da9 Eric Biggers 2022-05-02  476  =

d8c93cbf8d7da9 Eric Biggers 2022-05-02  477  		token =3D match_token(opt, t=
okens, args);
d8c93cbf8d7da9 Eric Biggers 2022-05-02  478  		switch (token) {
d8c93cbf8d7da9 Eric Biggers 2022-05-02  479  		case Opt_algtype:
d8c93cbf8d7da9 Eric Biggers 2022-05-02  480  			params.algtype =3D args[0].=
from;
d8c93cbf8d7da9 Eric Biggers 2022-05-02  481  			break;
d8c93cbf8d7da9 Eric Biggers 2022-05-02  482  		case Opt_algname:
d8c93cbf8d7da9 Eric Biggers 2022-05-02  483  			params.algname =3D args[0].=
from;
d8c93cbf8d7da9 Eric Biggers 2022-05-02  484  			break;
d8c93cbf8d7da9 Eric Biggers 2022-05-02  485  		case Opt_keysize:
d8c93cbf8d7da9 Eric Biggers 2022-05-02  486  			if (kstrtoint(args[0].from,=
 10, &params.keysize)) {
d8c93cbf8d7da9 Eric Biggers 2022-05-02  487  				pr_err("bad value for 'key=
size' option");
d8c93cbf8d7da9 Eric Biggers 2022-05-02  488  				goto bad_params;
d8c93cbf8d7da9 Eric Biggers 2022-05-02  489  			}
d8c93cbf8d7da9 Eric Biggers 2022-05-02  490  			break;
d8c93cbf8d7da9 Eric Biggers 2022-05-02  491  		case Opt_niter:
d8c93cbf8d7da9 Eric Biggers 2022-05-02  492  			if (kstrtoul(args[0].from, =
10, &params.niter)) {
d8c93cbf8d7da9 Eric Biggers 2022-05-02  493  				pr_err("bad value for 'nit=
er' option");
d8c93cbf8d7da9 Eric Biggers 2022-05-02  494  				goto bad_params;
d8c93cbf8d7da9 Eric Biggers 2022-05-02  495  			}
d8c93cbf8d7da9 Eric Biggers 2022-05-02  496  			break;
d8c93cbf8d7da9 Eric Biggers 2022-05-02  497  		case Opt_bufsize:
d8c93cbf8d7da9 Eric Biggers 2022-05-02  498  			if (kstrtoul(args[0].from, =
10, &params.bufsize)) {
d8c93cbf8d7da9 Eric Biggers 2022-05-02  499  				pr_err("bad value for 'buf=
size' option");
d8c93cbf8d7da9 Eric Biggers 2022-05-02  500  				goto bad_params;
d8c93cbf8d7da9 Eric Biggers 2022-05-02  501  			}
d8c93cbf8d7da9 Eric Biggers 2022-05-02  502  			break;
d8c93cbf8d7da9 Eric Biggers 2022-05-02  503  		case Opt_inplace:
d8c93cbf8d7da9 Eric Biggers 2022-05-02  504  			params.inplace =3D true;
d8c93cbf8d7da9 Eric Biggers 2022-05-02  505  			break;
d8c93cbf8d7da9 Eric Biggers 2022-05-02  506  		case Opt_random_seed:
d8c93cbf8d7da9 Eric Biggers 2022-05-02  507  			if (kstrtoull(args[0].from,=
 10, &params.random_seed)) {
d8c93cbf8d7da9 Eric Biggers 2022-05-02  508  				pr_err("bad value for 'ran=
dom_seed' option");
d8c93cbf8d7da9 Eric Biggers 2022-05-02  509  				goto bad_params;
d8c93cbf8d7da9 Eric Biggers 2022-05-02  510  			}
d8c93cbf8d7da9 Eric Biggers 2022-05-02  511  			break;
d8c93cbf8d7da9 Eric Biggers 2022-05-02  512  		default:
d8c93cbf8d7da9 Eric Biggers 2022-05-02  513  			pr_err("unrecognized option=
 '%s'\n", opt);
d8c93cbf8d7da9 Eric Biggers 2022-05-02  514  			goto bad_params;
d8c93cbf8d7da9 Eric Biggers 2022-05-02  515  		}
d8c93cbf8d7da9 Eric Biggers 2022-05-02  516  	}
d8c93cbf8d7da9 Eric Biggers 2022-05-02  517  =

d8c93cbf8d7da9 Eric Biggers 2022-05-02  518  	if (!params.algtype) {
d8c93cbf8d7da9 Eric Biggers 2022-05-02  519  		pr_err("'algtype' option is =
missing");
d8c93cbf8d7da9 Eric Biggers 2022-05-02  520  		goto bad_params;
d8c93cbf8d7da9 Eric Biggers 2022-05-02  521  	}
d8c93cbf8d7da9 Eric Biggers 2022-05-02  522  =

d8c93cbf8d7da9 Eric Biggers 2022-05-02  523  	if (!params.algname) {
d8c93cbf8d7da9 Eric Biggers 2022-05-02  524  		pr_err("'algname' option is =
missing");
d8c93cbf8d7da9 Eric Biggers 2022-05-02  525  		goto bad_params;
d8c93cbf8d7da9 Eric Biggers 2022-05-02  526  	}
d8c93cbf8d7da9 Eric Biggers 2022-05-02  527  =

d8c93cbf8d7da9 Eric Biggers 2022-05-02  528  	for (i =3D 0; i < ARRAY_SIZE(=
benchmark_funcs); i++) {
d8c93cbf8d7da9 Eric Biggers 2022-05-02  529  		if (!strcmp(benchmark_funcs[=
i].algtype, params.algtype)) {
d8c93cbf8d7da9 Eric Biggers 2022-05-02  530  			result =3D benchmark_funcs[=
i].f(&params);
d8c93cbf8d7da9 Eric Biggers 2022-05-02  531  			ret =3D size;
d8c93cbf8d7da9 Eric Biggers 2022-05-02  532  			if (result !=3D SUCCESS)
d8c93cbf8d7da9 Eric Biggers 2022-05-02  533  				goto save_error;
d8c93cbf8d7da9 Eric Biggers 2022-05-02  534  			goto out;
d8c93cbf8d7da9 Eric Biggers 2022-05-02  535  		}
d8c93cbf8d7da9 Eric Biggers 2022-05-02  536  	}
d8c93cbf8d7da9 Eric Biggers 2022-05-02  537  =

d8c93cbf8d7da9 Eric Biggers 2022-05-02  538  	pr_err("bad value for 'algtyp=
e' option");
d8c93cbf8d7da9 Eric Biggers 2022-05-02  539  bad_params:
d8c93cbf8d7da9 Eric Biggers 2022-05-02  540  	ret =3D -EINVAL;
d8c93cbf8d7da9 Eric Biggers 2022-05-02  541  	result =3D BAD_PARAMETERS;
d8c93cbf8d7da9 Eric Biggers 2022-05-02  542  save_error:
d8c93cbf8d7da9 Eric Biggers 2022-05-02  543  	sprintf(cryptobench_results, =
"ERROR %s\n", result_strings[result]);
d8c93cbf8d7da9 Eric Biggers 2022-05-02  544  out:
d8c93cbf8d7da9 Eric Biggers 2022-05-02  545  	mutex_unlock(&cryptobench_mut=
ex);
d8c93cbf8d7da9 Eric Biggers 2022-05-02  546  	kfree(optstr);
d8c93cbf8d7da9 Eric Biggers 2022-05-02  547  	return ret;
d8c93cbf8d7da9 Eric Biggers 2022-05-02  548  }
d8c93cbf8d7da9 Eric Biggers 2022-05-02  549  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6935199306363641854==--

