Content-Type: multipart/mixed; boundary="===============3185256686905150515=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3 3/3] crypto: qat - add backlog mechanism
Date: Tue, 12 Apr 2022 17:28:54 +0800
Message-ID: <202204121720.sOiGdzr5-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3185256686905150515==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220410194707.9746-4-giovanni.cabiddu@intel.com>
References: <20220410194707.9746-4-giovanni.cabiddu@intel.com>
TO: Giovanni Cabiddu <giovanni.cabiddu@intel.com>
TO: herbert(a)gondor.apana.org.au
CC: linux-crypto(a)vger.kernel.org
CC: qat-linux(a)intel.com
CC: Giovanni Cabiddu <giovanni.cabiddu@intel.com>
CC: stable(a)vger.kernel.org
CC: Mikulas Patocka <mpatocka@redhat.com>
CC: Kyle Sanderson <kyle.leet@gmail.com>
CC: Marco Chiappero <marco.chiappero@intel.com>

Hi Giovanni,

I love your patch! Perhaps something to improve:

[auto build test WARNING on herbert-cryptodev-2.6/master]
[also build test WARNING on herbert-crypto-2.6/master linus/master v5.18-rc=
2 next-20220412]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Giovanni-Cabiddu/cry=
pto-qat-fix-dm-crypt-related-issues/20220411-035723
base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2=
.6.git master
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
compiler: gcc-11 (Debian 11.2.0-19) 11.2.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout b2f52c00baca6016a116e0d0f76ca5e2d44c4507
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/crypto/qat/qat_common/qat_algs_send.c:29:29: warning: Uninitiali=
zed variable: req->tx_ring [uninitvar]
     if (adf_send_message(req->tx_ring, req->fw_req)) {
                               ^

vim +29 drivers/crypto/qat/qat_common/qat_algs_send.c

b2f52c00baca60 Giovanni Cabiddu 2022-04-10  22  =

b2f52c00baca60 Giovanni Cabiddu 2022-04-10  23  void qat_alg_send_backlog(s=
truct qat_instance_backlog *backlog)
b2f52c00baca60 Giovanni Cabiddu 2022-04-10  24  {
b2f52c00baca60 Giovanni Cabiddu 2022-04-10  25  	struct qat_alg_req *req, *=
tmp;
b2f52c00baca60 Giovanni Cabiddu 2022-04-10  26  =

b2f52c00baca60 Giovanni Cabiddu 2022-04-10  27  	spin_lock_bh(&backlog->loc=
k);
b2f52c00baca60 Giovanni Cabiddu 2022-04-10  28  	list_for_each_entry_safe(r=
eq, tmp, &backlog->list, list) {
b2f52c00baca60 Giovanni Cabiddu 2022-04-10 @29  		if (adf_send_message(req-=
>tx_ring, req->fw_req)) {
b2f52c00baca60 Giovanni Cabiddu 2022-04-10  30  			/* The HW ring is full. =
Do nothing.
b2f52c00baca60 Giovanni Cabiddu 2022-04-10  31  			 * qat_alg_send_backlog(=
) will be invoked again by
b2f52c00baca60 Giovanni Cabiddu 2022-04-10  32  			 * another callback.
b2f52c00baca60 Giovanni Cabiddu 2022-04-10  33  			 */
b2f52c00baca60 Giovanni Cabiddu 2022-04-10  34  			break;
b2f52c00baca60 Giovanni Cabiddu 2022-04-10  35  		}
b2f52c00baca60 Giovanni Cabiddu 2022-04-10  36  		list_del(&req->list);
b2f52c00baca60 Giovanni Cabiddu 2022-04-10  37  		req->base->complete(req->=
base, -EINPROGRESS);
b2f52c00baca60 Giovanni Cabiddu 2022-04-10  38  	}
b2f52c00baca60 Giovanni Cabiddu 2022-04-10  39  	spin_unlock_bh(&backlog->l=
ock);
b2f52c00baca60 Giovanni Cabiddu 2022-04-10  40  }
b2f52c00baca60 Giovanni Cabiddu 2022-04-10  41  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3185256686905150515==--

