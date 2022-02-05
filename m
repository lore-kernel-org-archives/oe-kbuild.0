Content-Type: multipart/mixed; boundary="===============8181330728007812714=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v32 25/28] Audit: Add record for multiple task security contexts
Date: Sat, 05 Feb 2022 12:51:06 +0800
Message-ID: <202202051254.pWPAs2Ha-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8181330728007812714==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220202235323.23929-26-casey@schaufler-ca.com>
References: <20220202235323.23929-26-casey@schaufler-ca.com>
TO: Casey Schaufler <casey@schaufler-ca.com>

Hi Casey,

I love your patch! Perhaps something to improve:

[auto build test WARNING on pcmoore-audit/next]
[also build test WARNING on nf-next/master nf/master linus/master v5.17-rc2=
 next-20220204]
[cannot apply to jmorris-security/next-testing]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Casey-Schaufler/integrity-=
disassociate-ima_filter_rule-from-security_audit_rule/20220203-085302
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/audit.git n=
ext
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-m021-20220131 (https://download.01.org/0day-ci/arch=
ive/20220205/202202051254.pWPAs2Ha-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
kernel/audit.c:2488 audit_log_end() warn: we never enter this loop

vim +2488 kernel/audit.c

25bd76f704528c Casey Schaufler 2022-02-02  2440  =

25bd76f704528c Casey Schaufler 2022-02-02  2441  /**
25bd76f704528c Casey Schaufler 2022-02-02  2442   * audit_log_end - end one=
 audit record
25bd76f704528c Casey Schaufler 2022-02-02  2443   * @ab: the audit_buffer
25bd76f704528c Casey Schaufler 2022-02-02  2444   *
25bd76f704528c Casey Schaufler 2022-02-02  2445   * Let __audit_log_end() h=
andle the message while the buffer housekeeping
25bd76f704528c Casey Schaufler 2022-02-02  2446   * is done here.
25bd76f704528c Casey Schaufler 2022-02-02  2447   * If there are other reco=
rds that have been deferred for the event
25bd76f704528c Casey Schaufler 2022-02-02  2448   * create them here.
25bd76f704528c Casey Schaufler 2022-02-02  2449   */
25bd76f704528c Casey Schaufler 2022-02-02  2450  void audit_log_end(struct =
audit_buffer *ab)
25bd76f704528c Casey Schaufler 2022-02-02  2451  {
25bd76f704528c Casey Schaufler 2022-02-02  2452  	struct audit_context_entr=
y *entry;
25bd76f704528c Casey Schaufler 2022-02-02  2453  	struct audit_context mcon=
text;
25bd76f704528c Casey Schaufler 2022-02-02  2454  	struct audit_context *mct=
x;
4efd871f917393 Casey Schaufler 2022-02-02  2455  	struct lsmcontext lcontex=
t;
25bd76f704528c Casey Schaufler 2022-02-02  2456  	struct audit_buffer *mab;
25bd76f704528c Casey Schaufler 2022-02-02  2457  	struct list_head *l;
25bd76f704528c Casey Schaufler 2022-02-02  2458  	struct list_head *n;
4efd871f917393 Casey Schaufler 2022-02-02  2459  	int rc;
4efd871f917393 Casey Schaufler 2022-02-02  2460  	int i;
25bd76f704528c Casey Schaufler 2022-02-02  2461  =

25bd76f704528c Casey Schaufler 2022-02-02  2462  	if (!ab)
25bd76f704528c Casey Schaufler 2022-02-02  2463  		return;
25bd76f704528c Casey Schaufler 2022-02-02  2464  =

25bd76f704528c Casey Schaufler 2022-02-02  2465  	__audit_log_end(ab);
25bd76f704528c Casey Schaufler 2022-02-02  2466  =

25bd76f704528c Casey Schaufler 2022-02-02  2467  	if (list_empty(&ab->aux_r=
ecords)) {
25bd76f704528c Casey Schaufler 2022-02-02  2468  		audit_buffer_free(ab);
25bd76f704528c Casey Schaufler 2022-02-02  2469  		return;
25bd76f704528c Casey Schaufler 2022-02-02  2470  	}
25bd76f704528c Casey Schaufler 2022-02-02  2471  =

25bd76f704528c Casey Schaufler 2022-02-02  2472  	if (ab->ctx =3D=3D NULL) {
4efd871f917393 Casey Schaufler 2022-02-02  2473  		mcontext.context =3D AUD=
IT_CTX_SYSCALL;
25bd76f704528c Casey Schaufler 2022-02-02  2474  		mcontext.stamp =3D ab->s=
tamp;
25bd76f704528c Casey Schaufler 2022-02-02  2475  		mctx =3D &mcontext;
25bd76f704528c Casey Schaufler 2022-02-02  2476  	} else
25bd76f704528c Casey Schaufler 2022-02-02  2477  		mctx =3D ab->ctx;
25bd76f704528c Casey Schaufler 2022-02-02  2478  =

25bd76f704528c Casey Schaufler 2022-02-02  2479  	list_for_each_safe(l, n, =
&ab->aux_records) {
25bd76f704528c Casey Schaufler 2022-02-02  2480  		entry =3D list_entry(l, =
struct audit_context_entry, list);
25bd76f704528c Casey Schaufler 2022-02-02  2481  		mab =3D audit_log_start(=
mctx, ab->gfp_mask, entry->type);
25bd76f704528c Casey Schaufler 2022-02-02  2482  		if (!mab) {
25bd76f704528c Casey Schaufler 2022-02-02  2483  			audit_panic("alloc erro=
r in audit_log_end");
25bd76f704528c Casey Schaufler 2022-02-02  2484  			continue;
25bd76f704528c Casey Schaufler 2022-02-02  2485  		}
25bd76f704528c Casey Schaufler 2022-02-02  2486  		switch (entry->type) {
4efd871f917393 Casey Schaufler 2022-02-02  2487  		case AUDIT_MAC_TASK_CONT=
EXTS:
4efd871f917393 Casey Schaufler 2022-02-02 @2488  			for (i =3D 0; i < LSMBL=
OB_ENTRIES; i++) {
4efd871f917393 Casey Schaufler 2022-02-02  2489  				if (entry->lsm_subjs.s=
ecid[i] =3D=3D 0)
4efd871f917393 Casey Schaufler 2022-02-02  2490  					continue;
4efd871f917393 Casey Schaufler 2022-02-02  2491  				rc =3D security_secid_=
to_secctx(&entry->lsm_subjs,
4efd871f917393 Casey Schaufler 2022-02-02  2492  							      &lcontext, i);
4efd871f917393 Casey Schaufler 2022-02-02  2493  				if (rc) {
4efd871f917393 Casey Schaufler 2022-02-02  2494  					if (rc !=3D -EINVAL)
4efd871f917393 Casey Schaufler 2022-02-02  2495  						audit_panic("error i=
n audit_log_end");
4efd871f917393 Casey Schaufler 2022-02-02  2496  					audit_log_format(mab,=
 "%ssubj_%s=3D?",
4efd871f917393 Casey Schaufler 2022-02-02  2497  							 i ? " " : "",
4efd871f917393 Casey Schaufler 2022-02-02  2498  							 lsm_slot_to_name(i=
));
4efd871f917393 Casey Schaufler 2022-02-02  2499  				} else {
4efd871f917393 Casey Schaufler 2022-02-02  2500  					audit_log_format(mab,=
 "%ssubj_%s=3D%s",
4efd871f917393 Casey Schaufler 2022-02-02  2501  							 i ? " " : "",
4efd871f917393 Casey Schaufler 2022-02-02  2502  							 lsm_slot_to_name(i=
),
4efd871f917393 Casey Schaufler 2022-02-02  2503  							 lcontext.context);
4efd871f917393 Casey Schaufler 2022-02-02  2504  					security_release_secc=
tx(&lcontext);
4efd871f917393 Casey Schaufler 2022-02-02  2505  				}
4efd871f917393 Casey Schaufler 2022-02-02  2506  			}
4efd871f917393 Casey Schaufler 2022-02-02  2507  			break;
25bd76f704528c Casey Schaufler 2022-02-02  2508  		default:
25bd76f704528c Casey Schaufler 2022-02-02  2509  			audit_panic("Unknown ty=
pe in audit_log_end");
25bd76f704528c Casey Schaufler 2022-02-02  2510  			break;
25bd76f704528c Casey Schaufler 2022-02-02  2511  		}
25bd76f704528c Casey Schaufler 2022-02-02  2512  		__audit_log_end(mab);
25bd76f704528c Casey Schaufler 2022-02-02  2513  		audit_buffer_free(mab);
25bd76f704528c Casey Schaufler 2022-02-02  2514  		list_del(&entry->list);
25bd76f704528c Casey Schaufler 2022-02-02  2515  		kfree(entry);
25bd76f704528c Casey Schaufler 2022-02-02  2516  	}
5b52330bbfe63b Paul Moore      2017-03-21  2517  =

b7d1125817c9a4 David Woodhouse 2005-05-19  2518  	audit_buffer_free(ab);
^1da177e4c3f41 Linus Torvalds  2005-04-16  2519  }
^1da177e4c3f41 Linus Torvalds  2005-04-16  2520  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8181330728007812714==--

