Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1143090C1
	for <oe-kbuild@lists.linux.dev>; Sun, 14 Jun 2026 22:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781476679; cv=none; b=nHJM7MBwWPWkU1JQQvDZk8euP6RpEpKn2rQc/WLw7W+16S+9Z+3Z6BrFbYOpO4HNBz9oHYaRtUFPgNvpMK4zRX6X7O9+62gBS2RZxywIqA0HLYE0bLwvNV3jeqfhv52vWT0db8l/uGueVWVgi3+HbfOejM8/b7kYafcTdWPIuzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781476679; c=relaxed/simple;
	bh=RjjLqGA0m18BZL5/jkxWBs91glPNhOfZWW+IDndqQ5g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=BNxmj6C5UVWMLPczdeKhwdWKeqwExj+AzDi/EH3/ySJmluxjn7NtQ9OksGuiTK+Rm9LFsfbpuUbSG3kvVST3lw+QxANENl8pwRwyEMChoU4oi83kSN+HQntA+yU0hhqovi5UWHQpqExgfAUoWB9kKIYRSFm/q3Mz3MVv0FzS3kE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kdqN7S/+; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kdqN7S/+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781476677; x=1813012677;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=RjjLqGA0m18BZL5/jkxWBs91glPNhOfZWW+IDndqQ5g=;
  b=kdqN7S/+gidzlatbQIB6Vt8zseGSoqb4lU+MIaYKTG91VcdVoHPGlY19
   /aBqI2gzEFKLKTvKQxhr4kJFzFKywLoiP+WjmLhd9E69OLHy7HOAZB5ig
   52y4YeUmVpB/cUxNXcJFdgvhJYrvsxrqYNWtY1/mzgUAmRsHMMCsPjQ6m
   HJEWunuhguW7ZldAahdC8VVMF+8Psxudsn4qb7UO4YO/Yt8CIEAoMILiG
   Zq150HZpzgWk9Z+5FQfjOlXg7r/mxTM0dtZSEpcFC7xA/enDF0ShvgY3i
   yZwDf2b5o1IQxD8Ju4imc32TXFsscLYDo0qfqoEauTkzyDvDr8KVwuioV
   w==;
X-CSE-ConnectionGUID: suh8rSadTZaoXK6a+Alt/A==
X-CSE-MsgGUID: hT2TVL6vTcK81lx2Qxd0Bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="69761194"
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; 
   d="scan'208";a="69761194"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2026 15:37:55 -0700
X-CSE-ConnectionGUID: ugHcU6VXQKugWjVXAPx/Mw==
X-CSE-MsgGUID: rJFHZuFqR2e8fOlWwu4Rrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; 
   d="scan'208";a="243164776"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 14 Jun 2026 15:37:54 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYtSh-00000000RG6-1HyK;
	Sun, 14 Jun 2026 22:37:51 +0000
Date: Mon, 15 Jun 2026 06:37:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [jj-apparmor:apparmor-next 15/32]
 security/apparmor/policy.c:1381 aa_replace_profiles() warn: statement has no
 effect 'ssize_t'
Message-ID: <202606150621.sDuQNvuz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Maxime B=C3=A9lair" <maxime.belair@canonical.com>
CC: John Johansen <john.johansen@canonical.com>
CC: Georgia Garcia <georgia.garcia@canonical.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jj/linux-apparmor.g=
it apparmor-next
head:   d0691bd5dcaec2350039ecb04fa70faa91ac142d
commit: 7b42f95813dc9ceb6bda35afcf914630909a19f9 [15/32] apparmor: fix pote=
ntial UAF in aa_replace_profiles
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: m68k-randconfig-r072-20260615 (https://download.01.org/0day-ci/arch=
ive/20260615/202606150621.sDuQNvuz-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 11.5.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202606150621.sDuQNvuz-lkp@intel.com/

New smatch warnings:
security/apparmor/policy.c:1381 aa_replace_profiles() warn: statement has n=
o effect 'ssize_t'
security/apparmor/policy.c:1381 aa_replace_profiles() warn: statement has n=
o effect 'ssize_t'

Old smatch warnings:
arch/m68k/include/asm/io_no.h:50 __cf_internalio() warn: always true condit=
ion '(addr <=3D 3758096384 + 536870912 - 1) =3D> (0-u32max <=3D u32max)'

vim +/ssize_t +1381 security/apparmor/policy.c

435222bc1bcc11 John Johansen 2017-06-09  1154 =20
c88d4c7b049e87 John Johansen 2010-07-29  1155  /**
c88d4c7b049e87 John Johansen 2010-07-29  1156   * aa_replace_profiles - rep=
lace profile(s) on the profile list
60285eb3e7c882 John Johansen 2017-06-04  1157   * @policy_ns: namespace loa=
d is occurring on
12dd7171d645a6 John Johansen 2017-01-16  1158   * @label: label that is att=
empting to load/replace policy
18e99f191a8e66 John Johansen 2017-05-26  1159   * @mask: permission mask
5ac8c355ae0013 John Johansen 2017-01-16  1160   * @udata: serialized data s=
tream  (NOT NULL)
c88d4c7b049e87 John Johansen 2010-07-29  1161   *
c88d4c7b049e87 John Johansen 2010-07-29  1162   * unpack and replace a prof=
ile on the profile list and uses of that profile
e1a03f627b5254 John Johansen 2017-01-27  1163   * by any task creds via inv=
alidating the old version of the profile, which
e1a03f627b5254 John Johansen 2017-01-27  1164   * tasks will notice to upda=
te their own cred.  If the profile does not exist
e1a03f627b5254 John Johansen 2017-01-27  1165   * on the profile list it is=
 added.
c88d4c7b049e87 John Johansen 2010-07-29  1166   *
c88d4c7b049e87 John Johansen 2010-07-29  1167   * Returns: size of data con=
sumed else error code on failure.
c88d4c7b049e87 John Johansen 2010-07-29  1168   */
637f688dc3dc30 John Johansen 2017-06-09  1169  ssize_t aa_replace_profiles(=
struct aa_ns *policy_ns, struct aa_label *label,
18e99f191a8e66 John Johansen 2017-05-26  1170  			    u32 mask, struct aa_l=
oaddata *udata)
c88d4c7b049e87 John Johansen 2010-07-29  1171  {
145a0ef21c8e94 John Johansen 2019-03-09  1172  	const char *ns_name =3D NUL=
L, *info =3D NULL;
98849dff90e270 John Johansen 2017-01-16  1173  	struct aa_ns *ns =3D NULL;
dd51c84857630e John Johansen 2013-07-10  1174  	struct aa_load_ent *ent, *t=
mp;
5d5182cae40115 John Johansen 2017-05-09  1175  	struct aa_loaddata *rawdata=
_ent;
18e99f191a8e66 John Johansen 2017-05-26  1176  	const char *op;
04dc715e24d082 John Johansen 2017-01-16  1177  	ssize_t count, error;
dd51c84857630e John Johansen 2013-07-10  1178  	LIST_HEAD(lh);
c88d4c7b049e87 John Johansen 2010-07-29  1179 =20
18e99f191a8e66 John Johansen 2017-05-26  1180  	op =3D mask & AA_MAY_REPLAC=
E_POLICY ? OP_PROF_REPL : OP_PROF_LOAD;
a0b7091c4de45a John Johansen 2026-02-24  1181  	aa_get_profile_loaddata(uda=
ta);
c88d4c7b049e87 John Johansen 2010-07-29  1182  	/* released below */
5ac8c355ae0013 John Johansen 2017-01-16  1183  	error =3D aa_unpack(udata, =
&lh, &ns_name);
dd51c84857630e John Johansen 2013-07-10  1184  	if (error)
dd51c84857630e John Johansen 2013-07-10  1185  		goto out;
c88d4c7b049e87 John Johansen 2010-07-29  1186 =20
04dc715e24d082 John Johansen 2017-01-16  1187  	/* ensure that profiles are=
 all for the same ns
aabbe6f908d826 Tanya Agarwal 2025-01-24  1188  	 * TODO: update locking to =
remove this constraint. All profiles in
04dc715e24d082 John Johansen 2017-01-16  1189  	 *       the load set must =
succeed as a set or the load will
04dc715e24d082 John Johansen 2017-01-16  1190  	 *       fail. Sort ent lis=
t and take ns locks in hierarchy order
04dc715e24d082 John Johansen 2017-01-16  1191  	 */
04dc715e24d082 John Johansen 2017-01-16  1192  	count =3D 0;
04dc715e24d082 John Johansen 2017-01-16  1193  	list_for_each_entry(ent, &l=
h, list) {
04dc715e24d082 John Johansen 2017-01-16  1194  		if (ns_name) {
04dc715e24d082 John Johansen 2017-01-16  1195  			if (ent->ns_name &&
04dc715e24d082 John Johansen 2017-01-16  1196  			    strcmp(ent->ns_name, =
ns_name) !=3D 0) {
04dc715e24d082 John Johansen 2017-01-16  1197  				info =3D "policy load ha=
s mixed namespaces";
04dc715e24d082 John Johansen 2017-01-16  1198  				error =3D -EACCES;
04dc715e24d082 John Johansen 2017-01-16  1199  				goto fail;
04dc715e24d082 John Johansen 2017-01-16  1200  			}
04dc715e24d082 John Johansen 2017-01-16  1201  		} else if (ent->ns_name) {
04dc715e24d082 John Johansen 2017-01-16  1202  			if (count) {
04dc715e24d082 John Johansen 2017-01-16  1203  				info =3D "policy load ha=
s mixed namespaces";
04dc715e24d082 John Johansen 2017-01-16  1204  				error =3D -EACCES;
04dc715e24d082 John Johansen 2017-01-16  1205  				goto fail;
04dc715e24d082 John Johansen 2017-01-16  1206  			}
04dc715e24d082 John Johansen 2017-01-16  1207  			ns_name =3D ent->ns_name;
5df0c44e8f5f61 John Johansen 2025-09-10  1208  			ent->ns_name =3D NULL;
04dc715e24d082 John Johansen 2017-01-16  1209  		} else
04dc715e24d082 John Johansen 2017-01-16  1210  			count++;
04dc715e24d082 John Johansen 2017-01-16  1211  	}
04dc715e24d082 John Johansen 2017-01-16  1212  	if (ns_name) {
637f688dc3dc30 John Johansen 2017-06-09  1213  		ns =3D aa_prepare_ns(polic=
y_ns ? policy_ns : labels_ns(label),
60285eb3e7c882 John Johansen 2017-06-04  1214  				   ns_name);
04dc715e24d082 John Johansen 2017-01-16  1215  		if (IS_ERR(ns)) {
b9b144bcafbdd5 John Johansen 2017-04-06  1216  			op =3D OP_PROF_LOAD;
04dc715e24d082 John Johansen 2017-01-16  1217  			info =3D "failed to prepa=
re namespace";
04dc715e24d082 John Johansen 2017-01-16  1218  			error =3D PTR_ERR(ns);
04dc715e24d082 John Johansen 2017-01-16  1219  			ns =3D NULL;
b9b144bcafbdd5 John Johansen 2017-04-06  1220  			ent =3D NULL;
04dc715e24d082 John Johansen 2017-01-16  1221  			goto fail;
c88d4c7b049e87 John Johansen 2010-07-29  1222  		}
04dc715e24d082 John Johansen 2017-01-16  1223  	} else
637f688dc3dc30 John Johansen 2017-06-09  1224  		ns =3D aa_get_ns(policy_ns=
 ? policy_ns : labels_ns(label));
c88d4c7b049e87 John Johansen 2010-07-29  1225 =20
feb3c766a3ab32 John Johansen 2017-11-20  1226  	mutex_lock_nested(&ns->lock=
, ns->level);
5d5182cae40115 John Johansen 2017-05-09  1227  	/* check for duplicate rawd=
ata blobs: space and file dedup */
d61c57fde81915 John Johansen 2021-02-01  1228  	if (!list_empty(&ns->rawdat=
a_list)) {
5d5182cae40115 John Johansen 2017-05-09  1229  		list_for_each_entry(rawdat=
a_ent, &ns->rawdata_list, list) {
5d5182cae40115 John Johansen 2017-05-09  1230  			if (aa_rawdata_eq(rawdata=
_ent, udata)) {
5d5182cae40115 John Johansen 2017-05-09  1231  				struct aa_loaddata *tmp;
5d5182cae40115 John Johansen 2017-05-09  1232 =20
a0b7091c4de45a John Johansen 2026-02-24  1233  				tmp =3D aa_get_profile_l=
oaddata(rawdata_ent);
5d5182cae40115 John Johansen 2017-05-09  1234  				/* check we didn't fail =
the race */
5d5182cae40115 John Johansen 2017-05-09  1235  				if (tmp) {
a0b7091c4de45a John Johansen 2026-02-24  1236  					aa_put_profile_loaddata=
(udata);
5d5182cae40115 John Johansen 2017-05-09  1237  					udata =3D tmp;
5d5182cae40115 John Johansen 2017-05-09  1238  					break;
5d5182cae40115 John Johansen 2017-05-09  1239  				}
5d5182cae40115 John Johansen 2017-05-09  1240  			}
5d5182cae40115 John Johansen 2017-05-09  1241  		}
d61c57fde81915 John Johansen 2021-02-01  1242  	}
dd51c84857630e John Johansen 2013-07-10  1243  	/* setup parent and ns info=
 */
dd51c84857630e John Johansen 2013-07-10  1244  	list_for_each_entry(ent, &l=
h, list) {
dd51c84857630e John Johansen 2013-07-10  1245  		struct aa_policy *policy;
665b1856dc2399 John Johansen 2022-10-03  1246  		struct aa_profile *p;
5d5182cae40115 John Johansen 2017-05-09  1247 =20
d61c57fde81915 John Johansen 2021-02-01  1248  		if (aa_g_export_binary)
a0b7091c4de45a John Johansen 2026-02-24  1249  			ent->new->rawdata =3D aa_=
get_profile_loaddata(udata);
18e99f191a8e66 John Johansen 2017-05-26  1250  		error =3D __lookup_replace=
(ns, ent->new->base.hname,
18e99f191a8e66 John Johansen 2017-05-26  1251  					 !(mask & AA_MAY_REPLAC=
E_POLICY),
dd51c84857630e John Johansen 2013-07-10  1252  					 &ent->old, &info);
dd51c84857630e John Johansen 2013-07-10  1253  		if (error)
dd51c84857630e John Johansen 2013-07-10  1254  			goto fail_lock;
dd51c84857630e John Johansen 2013-07-10  1255 =20
dd51c84857630e John Johansen 2013-07-10  1256  		if (ent->new->rename) {
dd51c84857630e John Johansen 2013-07-10  1257  			error =3D __lookup_replac=
e(ns, ent->new->rename,
18e99f191a8e66 John Johansen 2017-05-26  1258  						!(mask & AA_MAY_REPLAC=
E_POLICY),
18e99f191a8e66 John Johansen 2017-05-26  1259  						&ent->rename, &info);
dd51c84857630e John Johansen 2013-07-10  1260  			if (error)
dd51c84857630e John Johansen 2013-07-10  1261  				goto fail_lock;
c88d4c7b049e87 John Johansen 2010-07-29  1262  		}
c88d4c7b049e87 John Johansen 2010-07-29  1263 =20
dd51c84857630e John Johansen 2013-07-10  1264  		/* released when @new is f=
reed */
98849dff90e270 John Johansen 2017-01-16  1265  		ent->new->ns =3D aa_get_ns=
(ns);
c88d4c7b049e87 John Johansen 2010-07-29  1266 =20
dd51c84857630e John Johansen 2013-07-10  1267  		if (ent->old || ent->renam=
e)
dd51c84857630e John Johansen 2013-07-10  1268  			continue;
c88d4c7b049e87 John Johansen 2010-07-29  1269 =20
dd51c84857630e John Johansen 2013-07-10  1270  		/* no ref on policy only u=
se inside lock */
665b1856dc2399 John Johansen 2022-10-03  1271  		p =3D NULL;
dd51c84857630e John Johansen 2013-07-10  1272  		policy =3D __lookup_parent=
(ns, ent->new->base.hname);
dd51c84857630e John Johansen 2013-07-10  1273  		if (!policy) {
665b1856dc2399 John Johansen 2022-10-03  1274  			/* first check for parent=
 in the load set */
dd51c84857630e John Johansen 2013-07-10  1275  			p =3D __list_lookup_paren=
t(&lh, ent->new);
dd51c84857630e John Johansen 2013-07-10  1276  			if (!p) {
665b1856dc2399 John Johansen 2022-10-03  1277  				/*
665b1856dc2399 John Johansen 2022-10-03  1278  				 * fill in missing paren=
t with null
665b1856dc2399 John Johansen 2022-10-03  1279  				 * profile that doesn't =
have
665b1856dc2399 John Johansen 2022-10-03  1280  				 * permissions. This all=
ows for
665b1856dc2399 John Johansen 2022-10-03  1281  				 * individual profile lo=
ading where
665b1856dc2399 John Johansen 2022-10-03  1282  				 * the child is loaded b=
efore the
665b1856dc2399 John Johansen 2022-10-03  1283  				 * parent, and outside o=
f the current
665b1856dc2399 John Johansen 2022-10-03  1284  				 * atomic set. This unfo=
rtunately can
665b1856dc2399 John Johansen 2022-10-03  1285  				 * happen with some user=
spaces.  The
665b1856dc2399 John Johansen 2022-10-03  1286  				 * null profile will be =
replaced once
665b1856dc2399 John Johansen 2022-10-03  1287  				 * the parent is loaded.
665b1856dc2399 John Johansen 2022-10-03  1288  				 */
665b1856dc2399 John Johansen 2022-10-03  1289  				policy =3D __create_miss=
ing_ancestors(ns,
665b1856dc2399 John Johansen 2022-10-03  1290  							ent->new->base.hname,
665b1856dc2399 John Johansen 2022-10-03  1291  							GFP_KERNEL);
665b1856dc2399 John Johansen 2022-10-03  1292  				if (!policy) {
c88d4c7b049e87 John Johansen 2010-07-29  1293  					error =3D -ENOENT;
dd51c84857630e John Johansen 2013-07-10  1294  					info =3D "parent does n=
ot exist";
dd51c84857630e John Johansen 2013-07-10  1295  					goto fail_lock;
c88d4c7b049e87 John Johansen 2010-07-29  1296  				}
665b1856dc2399 John Johansen 2022-10-03  1297  			}
665b1856dc2399 John Johansen 2022-10-03  1298  		}
665b1856dc2399 John Johansen 2022-10-03  1299  		if (!p && policy !=3D &ns-=
>base)
dd51c84857630e John Johansen 2013-07-10  1300  			/* released on profile re=
placement or free_profile */
665b1856dc2399 John Johansen 2022-10-03  1301  			p =3D (struct aa_profile =
*) policy;
01e2b670aa898a John Johansen 2013-07-10  1302  		rcu_assign_pointer(ent->ne=
w->parent, aa_get_profile(p));
01e2b670aa898a John Johansen 2013-07-10  1303  	}
c88d4c7b049e87 John Johansen 2010-07-29  1304 =20
0d259f043f5f60 John Johansen 2013-07-10  1305  	/* create new fs entries fo=
r introspection if needed */
d61c57fde81915 John Johansen 2021-02-01  1306  	if (!udata->dents[AAFS_LOAD=
DATA_DIR] && aa_g_export_binary) {
5d5182cae40115 John Johansen 2017-05-09  1307  		error =3D __aa_fs_create_r=
awdata(ns, udata);
5d5182cae40115 John Johansen 2017-05-09  1308  		if (error) {
5d5182cae40115 John Johansen 2017-05-09  1309  			info =3D "failed to creat=
e raw_data dir and files";
5d5182cae40115 John Johansen 2017-05-09  1310  			ent =3D NULL;
5d5182cae40115 John Johansen 2017-05-09  1311  			goto fail_lock;
5d5182cae40115 John Johansen 2017-05-09  1312  		}
5d5182cae40115 John Johansen 2017-05-09  1313  	}
0d259f043f5f60 John Johansen 2013-07-10  1314  	list_for_each_entry(ent, &l=
h, list) {
dca91402e999aa John Johansen 2017-06-09  1315  		if (!ent->old) {
0d259f043f5f60 John Johansen 2013-07-10  1316  			struct dentry *parent;
0d259f043f5f60 John Johansen 2013-07-10  1317  			if (rcu_access_pointer(en=
t->new->parent)) {
0d259f043f5f60 John Johansen 2013-07-10  1318  				struct aa_profile *p;
0d259f043f5f60 John Johansen 2013-07-10  1319  				p =3D aa_deref_parent(en=
t->new);
0d259f043f5f60 John Johansen 2013-07-10  1320  				parent =3D prof_child_di=
r(p);
0d259f043f5f60 John Johansen 2013-07-10  1321  			} else
0d259f043f5f60 John Johansen 2013-07-10  1322  				parent =3D ns_subprofs_d=
ir(ent->new->ns);
c97204baf840bf John Johansen 2017-05-25  1323  			error =3D __aafs_profile_=
mkdir(ent->new, parent);
0d259f043f5f60 John Johansen 2013-07-10  1324  		}
0d259f043f5f60 John Johansen 2013-07-10  1325 =20
0d259f043f5f60 John Johansen 2013-07-10  1326  		if (error) {
0d259f043f5f60 John Johansen 2013-07-10  1327  			info =3D "failed to creat=
e";
0d259f043f5f60 John Johansen 2013-07-10  1328  			goto fail_lock;
0d259f043f5f60 John Johansen 2013-07-10  1329  		}
0d259f043f5f60 John Johansen 2013-07-10  1330  	}
0d259f043f5f60 John Johansen 2013-07-10  1331 =20
0d259f043f5f60 John Johansen 2013-07-10  1332  	/* Done with checks that ma=
y fail - do actual replacement */
5d5182cae40115 John Johansen 2017-05-09  1333  	__aa_bump_ns_revision(ns);
d61c57fde81915 John Johansen 2021-02-01  1334  	if (aa_g_export_binary)
5d5182cae40115 John Johansen 2017-05-09  1335  		__aa_loaddata_update(udata=
, ns->revision);
dd51c84857630e John Johansen 2013-07-10  1336  	list_for_each_entry_safe(en=
t, tmp, &lh, list) {
dd51c84857630e John Johansen 2013-07-10  1337  		list_del_init(&ent->list);
dd51c84857630e John Johansen 2013-07-10  1338  		op =3D (!ent->old && !ent-=
>rename) ? OP_PROF_LOAD : OP_PROF_REPL;
dd51c84857630e John Johansen 2013-07-10  1339 =20
d61c57fde81915 John Johansen 2021-02-01  1340  		if (ent->old && ent->old->=
rawdata =3D=3D ent->new->rawdata &&
d61c57fde81915 John Johansen 2021-02-01  1341  		    ent->new->rawdata) {
5d5182cae40115 John Johansen 2017-05-09  1342  			/* dedup actual profile r=
eplacement */
637f688dc3dc30 John Johansen 2017-06-09  1343  			audit_policy(label, op, n=
s_name, ent->new->base.hname,
5d5182cae40115 John Johansen 2017-05-09  1344  				     "same as current pr=
ofile, skipping",
5d5182cae40115 John Johansen 2017-05-09  1345  				     error);
3ddae9876a7045 John Johansen 2018-04-13  1346  			/* break refcount cycle w=
ith proxy. */
3ddae9876a7045 John Johansen 2018-04-13  1347  			aa_put_proxy(ent->new->la=
bel.proxy);
3ddae9876a7045 John Johansen 2018-04-13  1348  			ent->new->label.proxy =3D =
NULL;
5d5182cae40115 John Johansen 2017-05-09  1349  			goto skip;
5d5182cae40115 John Johansen 2017-05-09  1350  		}
5d5182cae40115 John Johansen 2017-05-09  1351 =20
5d5182cae40115 John Johansen 2017-05-09  1352  		/*
5d5182cae40115 John Johansen 2017-05-09  1353  		 * TODO: finer dedup based=
 on profile range in data. Load set
5d5182cae40115 John Johansen 2017-05-09  1354  		 * can differ but profile =
may remain unchanged
5d5182cae40115 John Johansen 2017-05-09  1355  		 */
637f688dc3dc30 John Johansen 2017-06-09  1356  		audit_policy(label, op, ns=
_name, ent->new->base.hname, NULL,
637f688dc3dc30 John Johansen 2017-06-09  1357  			     error);
dd51c84857630e John Johansen 2013-07-10  1358 =20
dd51c84857630e John Johansen 2013-07-10  1359  		if (ent->old) {
a1bd627b46d169 John Johansen 2017-06-09  1360  			share_name(ent->old, ent-=
>new);
637f688dc3dc30 John Johansen 2017-06-09  1361  			__replace_profile(ent->ol=
d, ent->new);
0d259f043f5f60 John Johansen 2013-07-10  1362  		} else {
435222bc1bcc11 John Johansen 2017-06-09  1363  			struct list_head *lh;
435222bc1bcc11 John Johansen 2017-06-09  1364 =20
435222bc1bcc11 John Johansen 2017-06-09  1365  			if (rcu_access_pointer(en=
t->new->parent)) {
435222bc1bcc11 John Johansen 2017-06-09  1366  				struct aa_profile *paren=
t;
435222bc1bcc11 John Johansen 2017-06-09  1367 =20
435222bc1bcc11 John Johansen 2017-06-09  1368  				parent =3D update_to_new=
est_parent(ent->new);
435222bc1bcc11 John Johansen 2017-06-09  1369  				lh =3D &parent->base.pro=
files;
435222bc1bcc11 John Johansen 2017-06-09  1370  			} else
435222bc1bcc11 John Johansen 2017-06-09  1371  				lh =3D &ns->base.profile=
s;
637f688dc3dc30 John Johansen 2017-06-09  1372  			__add_profile(lh, ent->ne=
w);
0d259f043f5f60 John Johansen 2013-07-10  1373  		}
5d5182cae40115 John Johansen 2017-05-09  1374  	skip:
dd51c84857630e John Johansen 2013-07-10  1375  		aa_load_ent_free(ent);
c88d4c7b049e87 John Johansen 2010-07-29  1376  	}
637f688dc3dc30 John Johansen 2017-06-09  1377  	__aa_labelset_update_subtre=
e(ns);
01e2b670aa898a John Johansen 2013-07-10  1378  	mutex_unlock(&ns->lock);
c88d4c7b049e87 John Johansen 2010-07-29  1379 =20
c88d4c7b049e87 John Johansen 2010-07-29  1380  out:
7b42f95813dc9c Maxime B=C3=A9lair 2026-02-18 @1381  	ssize_t udata_sz =3D u=
data->size;
7b42f95813dc9c Maxime B=C3=A9lair 2026-02-18  1382 =20
98849dff90e270 John Johansen 2017-01-16  1383  	aa_put_ns(ns);
a0b7091c4de45a John Johansen 2026-02-24  1384  	aa_put_profile_loaddata(uda=
ta);
145a0ef21c8e94 John Johansen 2019-03-09  1385  	kfree(ns_name);
dd51c84857630e John Johansen 2013-07-10  1386 =20
c88d4c7b049e87 John Johansen 2010-07-29  1387  	if (error)
c88d4c7b049e87 John Johansen 2010-07-29  1388  		return error;
7b42f95813dc9c Maxime B=C3=A9lair 2026-02-18  1389  	return udata_sz;
c88d4c7b049e87 John Johansen 2010-07-29  1390 =20
dd51c84857630e John Johansen 2013-07-10  1391  fail_lock:
01e2b670aa898a John Johansen 2013-07-10  1392  	mutex_unlock(&ns->lock);
dd51c84857630e John Johansen 2013-07-10  1393 =20
bf15cf0c641be8 John Johansen 2016-04-16  1394  	/* audit cause of failure */
5d5182cae40115 John Johansen 2017-05-09  1395  	op =3D (ent && !ent->old) ?=
 OP_PROF_LOAD : OP_PROF_REPL;
04dc715e24d082 John Johansen 2017-01-16  1396  fail:
637f688dc3dc30 John Johansen 2017-06-09  1397  	  audit_policy(label, op, n=
s_name, ent ? ent->new->base.hname : NULL,
12dd7171d645a6 John Johansen 2017-01-16  1398  		       info, error);
bf15cf0c641be8 John Johansen 2016-04-16  1399  	/* audit status that rest o=
f profiles in the atomic set failed too */
bf15cf0c641be8 John Johansen 2016-04-16  1400  	info =3D "valid profile in =
failed atomic policy load";
bf15cf0c641be8 John Johansen 2016-04-16  1401  	list_for_each_entry(tmp, &l=
h, list) {
bf15cf0c641be8 John Johansen 2016-04-16  1402  		if (tmp =3D=3D ent) {
bf15cf0c641be8 John Johansen 2016-04-16  1403  			info =3D "unchecked profi=
le in failed atomic policy load";
bf15cf0c641be8 John Johansen 2016-04-16  1404  			/* skip entry that caused=
 failure */
bf15cf0c641be8 John Johansen 2016-04-16  1405  			continue;
bf15cf0c641be8 John Johansen 2016-04-16  1406  		}
b9b144bcafbdd5 John Johansen 2017-04-06  1407  		op =3D (!tmp->old) ? OP_PR=
OF_LOAD : OP_PROF_REPL;
637f688dc3dc30 John Johansen 2017-06-09  1408  		audit_policy(label, op, ns=
_name, tmp->new->base.hname, info,
637f688dc3dc30 John Johansen 2017-06-09  1409  			     error);
bf15cf0c641be8 John Johansen 2016-04-16  1410  	}
dd51c84857630e John Johansen 2013-07-10  1411  	list_for_each_entry_safe(en=
t, tmp, &lh, list) {
dd51c84857630e John Johansen 2013-07-10  1412  		list_del_init(&ent->list);
dd51c84857630e John Johansen 2013-07-10  1413  		aa_load_ent_free(ent);
dd51c84857630e John Johansen 2013-07-10  1414  	}
dd51c84857630e John Johansen 2013-07-10  1415 =20
c88d4c7b049e87 John Johansen 2010-07-29  1416  	goto out;
c88d4c7b049e87 John Johansen 2010-07-29  1417  }
c88d4c7b049e87 John Johansen 2010-07-29  1418 =20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
