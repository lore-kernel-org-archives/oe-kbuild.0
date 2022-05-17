Content-Type: multipart/mixed; boundary="===============2672858720108557530=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [krzk-github:n/qcom-ufs-opp-v3 16/16] drivers/scsi/ufs/ufshcd.c:1056:2: warning: Undefined or garbage value returned to caller [clang-analyzer-core.uninitialized.UndefReturn]
Date: Wed, 18 May 2022 00:40:39 +0800
Message-ID: <202205180048.Qnv3EnfX-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2672858720108557530==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Krzysztof Kozlowski <krzk@kernel.org>
CC: Bjorn Andersson <bjorn.andersson@linaro.org>

tree:   https://github.com/krzk/linux n/qcom-ufs-opp-v3
head:   00fbe567c9dc48a8d0c625f3955587a7a21aca8e
commit: 00fbe567c9dc48a8d0c625f3955587a7a21aca8e [16/16] ufs: use PM OPP wh=
en scaling gears
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: i386-randconfig-c001-20220516 (https://download.01.org/0day-ci/arch=
ive/20220518/202205180048.Qnv3EnfX-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 853fa8=
ee225edf2d0de94b0dcbd31bea916e825e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/krzk/linux/commit/00fbe567c9dc48a8d0c625f39555=
87a7a21aca8e
        git remote add krzk-github https://github.com/krzk/linux
        git fetch --no-tags krzk-github n/qcom-ufs-opp-v3
        git checkout 00fbe567c9dc48a8d0c625f3955587a7a21aca8e
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                ^     ~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/st.c:4353:2: warning: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           sprintf(tpnt->name, "st%d", tpnt->index);
           ^~~~~~~
   drivers/scsi/st.c:4353:2: note: Call to function 'sprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'sprintf_s' in case of C11
           sprintf(tpnt->name, "st%d", tpnt->index);
           ^~~~~~~
   drivers/scsi/st.c:4570:6: warning: Call to function 'snprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           l =3D snprintf(buf, PAGE_SIZE, "%d\n", STm->defined);
               ^~~~~~~~
   drivers/scsi/st.c:4570:6: note: Call to function 'snprintf' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'snprintf_s' in case of C11
           l =3D snprintf(buf, PAGE_SIZE, "%d\n", STm->defined);
               ^~~~~~~~
   drivers/scsi/st.c:4582:6: warning: Call to function 'snprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           l =3D snprintf(buf, PAGE_SIZE, "%d\n", STm->default_blksize);
               ^~~~~~~~
   drivers/scsi/st.c:4582:6: note: Call to function 'snprintf' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'snprintf_s' in case of C11
           l =3D snprintf(buf, PAGE_SIZE, "%d\n", STm->default_blksize);
               ^~~~~~~~
   drivers/scsi/st.c:4596:6: warning: Call to function 'snprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           l =3D snprintf(buf, PAGE_SIZE, fmt, STm->default_density);
               ^~~~~~~~
   drivers/scsi/st.c:4596:6: note: Call to function 'snprintf' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'snprintf_s' in case of C11
           l =3D snprintf(buf, PAGE_SIZE, fmt, STm->default_density);
               ^~~~~~~~
   drivers/scsi/st.c:4608:6: warning: Call to function 'snprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           l =3D snprintf(buf, PAGE_SIZE, "%d\n", STm->default_compression =
- 1);
               ^~~~~~~~
   drivers/scsi/st.c:4608:6: note: Call to function 'snprintf' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'snprintf_s' in case of C11
           l =3D snprintf(buf, PAGE_SIZE, "%d\n", STm->default_compression =
- 1);
               ^~~~~~~~
   drivers/scsi/st.c:4637:6: warning: Call to function 'snprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           l =3D snprintf(buf, PAGE_SIZE, "0x%08x\n", options);
               ^~~~~~~~
   drivers/scsi/st.c:4637:6: note: Call to function 'snprintf' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'snprintf_s' in case of C11
           l =3D snprintf(buf, PAGE_SIZE, "0x%08x\n", options);
               ^~~~~~~~
   drivers/scsi/st.c:4655:9: warning: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%lld",
                  ^~~~~~~
   drivers/scsi/st.c:4655:9: note: Call to function 'sprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%lld",
                  ^~~~~~~
   drivers/scsi/st.c:4673:9: warning: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%lld",
                  ^~~~~~~
   drivers/scsi/st.c:4673:9: note: Call to function 'sprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%lld",
                  ^~~~~~~
   drivers/scsi/st.c:4689:9: warning: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%lld",
                  ^~~~~~~
   drivers/scsi/st.c:4689:9: note: Call to function 'sprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%lld",
                  ^~~~~~~
   drivers/scsi/st.c:4706:9: warning: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%lld",
                  ^~~~~~~
   drivers/scsi/st.c:4706:9: note: Call to function 'sprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%lld",
                  ^~~~~~~
   drivers/scsi/st.c:4723:9: warning: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%lld",
                  ^~~~~~~
   drivers/scsi/st.c:4723:9: note: Call to function 'sprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%lld",
                  ^~~~~~~
   drivers/scsi/st.c:4740:9: warning: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%lld",
                  ^~~~~~~
   drivers/scsi/st.c:4740:9: note: Call to function 'sprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%lld",
                  ^~~~~~~
   drivers/scsi/st.c:4758:9: warning: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%lld",
                  ^~~~~~~
   drivers/scsi/st.c:4758:9: note: Call to function 'sprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%lld",
                  ^~~~~~~
   drivers/scsi/st.c:4778:9: warning: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%lld",
                  ^~~~~~~
   drivers/scsi/st.c:4778:9: note: Call to function 'sprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%lld",
                  ^~~~~~~
   drivers/scsi/st.c:4797:9: warning: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%lld",
                  ^~~~~~~
   drivers/scsi/st.c:4797:9: note: Call to function 'sprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%lld",
                  ^~~~~~~
   drivers/scsi/st.c:4815:9: warning: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%lld",
                  ^~~~~~~
   drivers/scsi/st.c:4815:9: note: Call to function 'sprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%lld",
                  ^~~~~~~
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   112 warnings generated.
>> drivers/scsi/ufs/ufshcd.c:1056:2: warning: Undefined or garbage value re=
turned to caller [clang-analyzer-core.uninitialized.UndefReturn]
           return ret;
           ^      ~~~
   drivers/scsi/ufs/ufshcd.c:1038:9: note: 'ret' declared without an initia=
l value
           int i, ret;
                  ^~~
   drivers/scsi/ufs/ufshcd.c:1040:6: note: Assuming field 'clk_count' is no=
t equal to 0
           if (!data->clk_count)
               ^~~~~~~~~~~~~~~~
   drivers/scsi/ufs/ufshcd.c:1040:2: note: Taking false branch
           if (!data->clk_count)
           ^
   drivers/scsi/ufs/ufshcd.c:1043:14: note: 'i' is < field 'clk_count'
           for (i =3D 0; i < data->clk_count; i++) {
                       ^
   drivers/scsi/ufs/ufshcd.c:1043:2: note: Loop condition is true.  Enterin=
g loop body
           for (i =3D 0; i < data->clk_count; i++) {
           ^
   drivers/scsi/ufs/ufshcd.c:1044:7: note: Assuming the condition is true
                   if (!data->new_opp.rates[i])
                       ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/ufs/ufshcd.c:1044:3: note: Taking true branch
                   if (!data->new_opp.rates[i])
                   ^
   drivers/scsi/ufs/ufshcd.c:1045:4: note:  Execution continues on line 1043
                           continue;
                           ^
   drivers/scsi/ufs/ufshcd.c:1043:14: note: Assuming 'i' is >=3D field 'clk=
_count'
           for (i =3D 0; i < data->clk_count; i++) {
                       ^~~~~~~~~~~~~~~~~~~
   drivers/scsi/ufs/ufshcd.c:1043:2: note: Loop condition is false. Executi=
on continues on line 1056
           for (i =3D 0; i < data->clk_count; i++) {
           ^
   drivers/scsi/ufs/ufshcd.c:1056:2: note: Undefined or garbage value retur=
ned to caller
           return ret;
           ^      ~~~
   drivers/scsi/ufs/ufshcd.c:1233:3: warning: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&new_pwr_info, &hba->clk_scaling.saved_pwr_info.i=
nfo,
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/scsi/ufs/ufshcd.c:1233:3: note: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11
                   memcpy(&new_pwr_info, &hba->clk_scaling.saved_pwr_info.i=
nfo,
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/scsi/ufs/ufshcd.c:1236:3: warning: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&new_pwr_info, &hba->pwr_info,
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/scsi/ufs/ufshcd.c:1236:3: note: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11
                   memcpy(&new_pwr_info, &hba->pwr_info,
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/scsi/ufs/ufshcd.c:1242:4: warning: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(&hba->clk_scaling.saved_pwr_info.info,
                           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/scsi/ufs/ufshcd.c:1242:4: note: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11
                           memcpy(&hba->clk_scaling.saved_pwr_info.info,
                           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/scsi/ufs/ufshcd.c:1469:2: warning: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(stat, 0, sizeof(*stat));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/scsi/ufs/ufshcd.c:1469:2: note: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11
           memset(stat, 0, sizeof(*stat));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/scsi/ufs/ufshcd.c:1539:32: warning: Access to field 'min_freq' r=
esults in a dereference of an undefined pointer value (loaded from variable=
 'clki') [clang-analyzer-core.NullDereference]
                           dev_pm_opp_remove(hba->dev, clki->min_freq);
                                                       ^
   drivers/scsi/ufs/ufshcd.c:8312:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/scsi/ufs/ufshcd.c:8312:2: note: Taking false branch
           if (ret)
           ^
   drivers/scsi/ufs/ufshcd.c:8316:8: note: Calling 'ufshcd_add_lus'
           ret =3D ufshcd_add_lus(hba);
                 ^~~~~~~~~~~~~~~~~~~
   drivers/scsi/ufs/ufshcd.c:8169:8: note: Calling 'ufshcd_scsi_add_wlus'
           ret =3D ufshcd_scsi_add_wlus(hba);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/ufs/ufshcd.c:7601:2: note: Taking false branch
           if (IS_ERR(hba->ufs_device_wlun)) {

vim +1056 drivers/scsi/ufs/ufshcd.c

394b949f2d919ce Subhash Jadavani    2020-03-26  1028  =

00fbe567c9dc48a Krzysztof Kozlowski 2022-04-01  1029  /**
00fbe567c9dc48a Krzysztof Kozlowski 2022-04-01  1030   * ufshcd_set_opp - s=
cale UFS controller clocks, called via PM OPP
00fbe567c9dc48a Krzysztof Kozlowski 2022-04-01  1031   * @data: PM OPP data
00fbe567c9dc48a Krzysztof Kozlowski 2022-04-01  1032   *
00fbe567c9dc48a Krzysztof Kozlowski 2022-04-01  1033   * Returns 0 for succ=
ess, non-zero error value for errors.
00fbe567c9dc48a Krzysztof Kozlowski 2022-04-01  1034   */
00fbe567c9dc48a Krzysztof Kozlowski 2022-04-01  1035  int ufshcd_set_opp(st=
ruct dev_pm_set_opp_data *data)
00fbe567c9dc48a Krzysztof Kozlowski 2022-04-01  1036  {
00fbe567c9dc48a Krzysztof Kozlowski 2022-04-01  1037  	struct ufs_hba *hba =
=3D dev_get_drvdata(data->dev);
00fbe567c9dc48a Krzysztof Kozlowski 2022-04-01  1038  	int i, ret;
00fbe567c9dc48a Krzysztof Kozlowski 2022-04-01  1039  =

00fbe567c9dc48a Krzysztof Kozlowski 2022-04-01  1040  	if (!data->clk_count)
00fbe567c9dc48a Krzysztof Kozlowski 2022-04-01  1041  		return 0;
00fbe567c9dc48a Krzysztof Kozlowski 2022-04-01  1042  =

00fbe567c9dc48a Krzysztof Kozlowski 2022-04-01  1043  	for (i =3D 0; i < da=
ta->clk_count; i++) {
00fbe567c9dc48a Krzysztof Kozlowski 2022-04-01  1044  		if (!data->new_opp.=
rates[i])
00fbe567c9dc48a Krzysztof Kozlowski 2022-04-01  1045  			continue;
00fbe567c9dc48a Krzysztof Kozlowski 2022-04-01  1046  =

00fbe567c9dc48a Krzysztof Kozlowski 2022-04-01  1047  		ret =3D clk_set_rat=
e(data->clks[i].clk, data->new_opp.rates[i]);
00fbe567c9dc48a Krzysztof Kozlowski 2022-04-01  1048  		if (ret) {
00fbe567c9dc48a Krzysztof Kozlowski 2022-04-01  1049  			dev_err(hba->dev, =
"%s: %pC clk set rate(%luHz) failed, %d\n",
00fbe567c9dc48a Krzysztof Kozlowski 2022-04-01  1050  				__func__, data->c=
lks[i].clk,
00fbe567c9dc48a Krzysztof Kozlowski 2022-04-01  1051  				data->new_opp.rat=
es[i], ret);
00fbe567c9dc48a Krzysztof Kozlowski 2022-04-01  1052  			break;
00fbe567c9dc48a Krzysztof Kozlowski 2022-04-01  1053  		}
00fbe567c9dc48a Krzysztof Kozlowski 2022-04-01  1054  	}
00fbe567c9dc48a Krzysztof Kozlowski 2022-04-01  1055  =

00fbe567c9dc48a Krzysztof Kozlowski 2022-04-01 @1056  	return ret;
00fbe567c9dc48a Krzysztof Kozlowski 2022-04-01  1057  }
00fbe567c9dc48a Krzysztof Kozlowski 2022-04-01  1058  EXPORT_SYMBOL_GPL(ufs=
hcd_set_opp);
00fbe567c9dc48a Krzysztof Kozlowski 2022-04-01  1059  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2672858720108557530==--

