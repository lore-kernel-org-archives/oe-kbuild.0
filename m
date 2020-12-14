Content-Type: multipart/mixed; boundary="===============6649074362146578794=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: net/wireless/scan.c:552:2: warning: Assignment of function parameter has no effect outside the function. Did you forget dereferencing
Date: Tue, 15 Dec 2020 07:06:50 +0800
Message-ID: <202012150745.eY01m2oR-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6649074362146578794==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Tova Mussai <tova.mussai@intel.com>
CC: Johannes Berg <johannes.berg@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   fab0fca1da5cdc48be051715cd9787df04fdce3a
commit: c8cb5b854b40f2ce52ccd032fa19750f4181d5fc nl80211/cfg80211: support =
6 GHz scanning
date:   3 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 3 months ago
compiler: c6x-elf-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> net/wireless/scan.c:552:2: warning: Assignment of function parameter has=
 no effect outside the function. Did you forget dereferencing it? [uselessA=
ssignmentPtrArg]
    pos++;
    ^

vim +552 net/wireless/scan.c

c8cb5b854b40f2c Tova Mussai 2020-09-18  530  =

c8cb5b854b40f2c Tova Mussai 2020-09-18  531  static int cfg80211_parse_ap_i=
nfo(struct cfg80211_colocated_ap *entry,
c8cb5b854b40f2c Tova Mussai 2020-09-18  532  				  const u8 *pos, u8 length,
c8cb5b854b40f2c Tova Mussai 2020-09-18  533  				  const struct element *ss=
id_elem,
c8cb5b854b40f2c Tova Mussai 2020-09-18  534  				  int s_ssid_tmp)
c8cb5b854b40f2c Tova Mussai 2020-09-18  535  {
c8cb5b854b40f2c Tova Mussai 2020-09-18  536  	/* skip the TBTT offset */
c8cb5b854b40f2c Tova Mussai 2020-09-18  537  	pos++;
c8cb5b854b40f2c Tova Mussai 2020-09-18  538  =

c8cb5b854b40f2c Tova Mussai 2020-09-18  539  	memcpy(entry->bssid, pos, ETH=
_ALEN);
c8cb5b854b40f2c Tova Mussai 2020-09-18  540  	pos +=3D ETH_ALEN;
c8cb5b854b40f2c Tova Mussai 2020-09-18  541  =

c8cb5b854b40f2c Tova Mussai 2020-09-18  542  	if (length =3D=3D IEEE80211_T=
BTT_INFO_OFFSET_BSSID_SSSID_BSS_PARAM) {
c8cb5b854b40f2c Tova Mussai 2020-09-18  543  		memcpy(&entry->short_ssid, p=
os,
c8cb5b854b40f2c Tova Mussai 2020-09-18  544  		       sizeof(entry->short_s=
sid));
c8cb5b854b40f2c Tova Mussai 2020-09-18  545  		entry->short_ssid_valid =3D =
true;
c8cb5b854b40f2c Tova Mussai 2020-09-18  546  		pos +=3D 4;
c8cb5b854b40f2c Tova Mussai 2020-09-18  547  	}
c8cb5b854b40f2c Tova Mussai 2020-09-18  548  =

c8cb5b854b40f2c Tova Mussai 2020-09-18  549  	/* skip non colocated APs */
c8cb5b854b40f2c Tova Mussai 2020-09-18  550  	if (!cfg80211_parse_bss_param=
(*pos, entry))
c8cb5b854b40f2c Tova Mussai 2020-09-18  551  		return -EINVAL;
c8cb5b854b40f2c Tova Mussai 2020-09-18 @552  	pos++;
c8cb5b854b40f2c Tova Mussai 2020-09-18  553  =

c8cb5b854b40f2c Tova Mussai 2020-09-18  554  	if (length =3D=3D IEEE80211_T=
BTT_INFO_OFFSET_BSSID_BSS_PARAM) {
c8cb5b854b40f2c Tova Mussai 2020-09-18  555  		/*
c8cb5b854b40f2c Tova Mussai 2020-09-18  556  		 * no information about the =
short ssid. Consider the entry valid
c8cb5b854b40f2c Tova Mussai 2020-09-18  557  		 * for now. It would later b=
e dropped in case there are explicit
c8cb5b854b40f2c Tova Mussai 2020-09-18  558  		 * SSIDs that need to be mat=
ched
c8cb5b854b40f2c Tova Mussai 2020-09-18  559  		 */
c8cb5b854b40f2c Tova Mussai 2020-09-18  560  		if (!entry->same_ssid)
c8cb5b854b40f2c Tova Mussai 2020-09-18  561  			return 0;
c8cb5b854b40f2c Tova Mussai 2020-09-18  562  	}
c8cb5b854b40f2c Tova Mussai 2020-09-18  563  =

c8cb5b854b40f2c Tova Mussai 2020-09-18  564  	if (entry->same_ssid) {
c8cb5b854b40f2c Tova Mussai 2020-09-18  565  		entry->short_ssid =3D s_ssid=
_tmp;
c8cb5b854b40f2c Tova Mussai 2020-09-18  566  		entry->short_ssid_valid =3D =
true;
c8cb5b854b40f2c Tova Mussai 2020-09-18  567  =

c8cb5b854b40f2c Tova Mussai 2020-09-18  568  		/*
c8cb5b854b40f2c Tova Mussai 2020-09-18  569  		 * This is safe because we v=
alidate datalen in
c8cb5b854b40f2c Tova Mussai 2020-09-18  570  		 * cfg80211_parse_colocated_=
ap(), before calling this
c8cb5b854b40f2c Tova Mussai 2020-09-18  571  		 * function.
c8cb5b854b40f2c Tova Mussai 2020-09-18  572  		 */
c8cb5b854b40f2c Tova Mussai 2020-09-18  573  		memcpy(&entry->ssid, &ssid_e=
lem->data,
c8cb5b854b40f2c Tova Mussai 2020-09-18  574  		       ssid_elem->datalen);
c8cb5b854b40f2c Tova Mussai 2020-09-18  575  		entry->ssid_len =3D ssid_ele=
m->datalen;
c8cb5b854b40f2c Tova Mussai 2020-09-18  576  	}
c8cb5b854b40f2c Tova Mussai 2020-09-18  577  	return 0;
c8cb5b854b40f2c Tova Mussai 2020-09-18  578  }
c8cb5b854b40f2c Tova Mussai 2020-09-18  579  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6649074362146578794==--

