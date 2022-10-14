$(document).ready(() => {
    window.addEventListener('message', function (event) {
        switch (event['data']['action']) {
            case 'openSystem':
                $('#charPage').css('display', 'flex');
                generateSelect();
                break;

            case 'closeSystem':
                $('#charPage').css('display', 'none');
                break;

            case 'openSpawn':
                $('#charSpawn').css('display', 'flex');
                break;

            case 'closeNew':
                $('#charPage').css('display', 'none');
                $('#charRegister').css('display', 'none');
                break;

            case 'closeSpawn':
                $('#charSpawn').css('display', 'none');
                break;
        }
    });

    $('.change').on('click', function () {
        if ($(this).attr('data-group') === 'gender') {
            $('.male, .female').removeClass('active');
            $(this).addClass('active');
        } else {
            $('.north, .south').removeClass('active');
            $(this).addClass('active');
        }
    });

    function generateSelect() {
        $.post(
            'http://spawn/generateDisplay',
            JSON.stringify({}),
            (data) => {
                let screenCode = '';
                var characterList = data['result'].sort((a, b) =>
                    a['user_id'] > b['user_id'] ? 1 : -1
                );

                characterList.forEach((char) => {
                    screenCode += `
          <div class="person-area">
            <div class="person-info">
              <div class="primary-data">
                <p></p>
              </div>
              <div class="secondary-data">
                <div class="info-block">
					<svg width="114" height="115" viewBox="0 0 114 115" fill="none" xmlns="http://www.w3.org/2000/svg">
						<g filter="url(#filter0_d_60_16)">
							<path fill-rule="evenodd" clip-rule="evenodd" d="M24.8037 27.6116C23.9225 29.012 23.509 30.5414 23.5168 32.3707L23.5237 34.008L30.8913 61.3796C34.9433 76.4339 38.3587 89.0484 38.4807 89.4118C38.8139 90.4032 39.7667 91.9264 40.5329 92.6926C41.3791 93.5388 42.8817 94.4403 44.2067 94.8967C45.6591 95.397 48.1077 95.3762 49.6472 94.8505C51.8709 94.0911 50.2846 95.5889 73.1938 72.6193C92.9421 52.8189 93.8404 51.9023 94.1968 51.1857C96.3484 46.8595 95.1124 41.8819 91.2644 39.3761C90.8018 39.0749 90.1941 38.7366 89.914 38.6244C88.8322 38.1913 34.2318 23.6315 33.281 23.5226C31.8094 23.3541 30.0048 23.6579 28.6028 24.3104C27.1602 24.9816 25.6121 26.3268 24.8037 27.6116Z" fill="url(#paint0_linear_60_16)"/>
						</g>
						<path fill-rule="evenodd" clip-rule="evenodd" d="M30.9151 31.1637C29.9615 31.4028 29.2477 31.8111 28.5287 32.5289C27.7881 33.2682 27.3405 34.0824 27.1342 35.065C26.9538 35.9243 26.956 68.0838 27.1364 68.9288C27.5528 70.8784 29.1166 72.4454 31.0622 72.8627C31.9099 73.0445 80.0767 73.0464 80.9379 72.8647C82.8597 72.4591 84.4647 70.8512 84.8664 68.9288C85.0463 68.0682 85.0437 35.9078 84.8637 35.065C84.4463 33.1104 82.8778 31.5377 80.9379 31.129C80.0223 30.9359 31.6895 30.9695 30.9151 31.1637ZM45.4021 38.145C47.2687 38.799 48.702 40.2406 49.3366 42.1023C49.5372 42.6904 49.5962 43.117 49.5985 43.9963C49.6021 45.3723 49.3212 46.3858 48.6463 47.4321L48.193 48.1349L48.8538 48.5846C50.2087 49.5065 51.4869 51.025 52.1596 52.5117C52.7406 53.7956 52.955 54.7679 53.0227 56.4263C53.0806 57.8428 53.0666 57.9988 52.8425 58.4391C52.6809 58.7564 52.4497 58.9929 52.1525 59.1449C51.7166 59.3677 51.5005 59.3733 43.4154 59.3733H35.1253L34.6544 59.0969C33.8909 58.6484 33.7579 58.2111 33.8332 56.3968C33.9244 54.2029 34.3919 52.7302 35.5316 51.0459C36.2415 49.9969 37.5073 48.8354 38.6503 48.184C38.6691 48.1732 38.4812 47.8492 38.2327 47.4638C37.5141 46.3498 37.2603 45.4594 37.2603 44.053C37.2603 43.106 37.3137 42.7057 37.5205 42.1023C38.2633 39.9348 40.1285 38.3251 42.41 37.8823C43.0252 37.7629 44.7416 37.9136 45.4021 38.145ZM77.2941 38.0399C77.7965 38.2968 78.1971 38.9506 78.1971 39.5137C78.1971 40.0768 77.7965 40.7306 77.2941 40.9875C76.8568 41.2111 76.6447 41.216 67.43 41.216H58.0127L57.561 40.9615C56.4212 40.3197 56.4097 38.7663 57.5395 38.081L57.9819 37.8126L67.4146 37.812C76.6452 37.8114 76.8567 37.8163 77.2941 38.0399ZM42.4197 41.4108C41.4207 41.7644 40.598 42.9576 40.598 44.053C40.598 44.7385 40.9358 45.5324 41.4444 46.042C42.5521 47.1521 44.3064 47.1521 45.4141 46.042C47.545 43.9068 45.2773 40.3994 42.4197 41.4108ZM77.2941 44.8489C77.7965 45.1058 78.1971 45.7596 78.1971 46.3227C78.1971 46.8858 77.7965 47.5396 77.2941 47.7965C76.8568 48.0201 76.6447 48.025 67.43 48.025H58.0127L57.561 47.7705C56.4212 47.1287 56.4097 45.5753 57.5395 44.89L57.9819 44.6216L67.4146 44.621C76.6452 44.6205 76.8567 44.6253 77.2941 44.8489ZM41.8654 50.5167C39.4528 51.1725 37.7035 53.1076 37.2703 55.6L37.2062 55.9688H43.4342H49.6623L49.5949 55.6567C49.0379 53.0777 47.6532 51.4169 45.4021 50.6282C44.4081 50.28 42.9102 50.2328 41.8654 50.5167ZM77.2941 53.9276C77.5818 54.0747 77.8224 54.3157 77.9691 54.6041C78.1871 55.0324 78.1971 55.265 78.1971 59.9407C78.1971 64.6165 78.1871 64.8491 77.9691 65.2774C77.8224 65.5658 77.5818 65.8068 77.2941 65.9539C76.8665 66.1724 76.6345 66.1823 71.96 66.1823C67.1067 66.1823 67.0697 66.1805 66.621 65.9279C65.7309 65.4265 65.7389 65.4818 65.7443 59.9169C65.7497 54.3877 65.7345 54.4934 66.5995 53.9687L67.042 53.7003L71.9446 53.6997C76.6352 53.6992 76.8664 53.709 77.2941 53.9276ZM69.1371 59.9407V62.7778H71.9683H74.7996V59.9407V57.1037H71.9683H69.1371V59.9407ZM52.1525 63.0063C52.655 63.2632 53.0555 63.917 53.0555 64.4801C53.0555 65.0432 52.655 65.697 52.1525 65.9539C51.7166 66.1767 51.5005 66.1823 43.4209 66.1823H35.1362L34.6844 65.9279C33.5447 65.286 33.5331 63.7327 34.6629 63.0474L35.1054 62.779L43.4055 62.7784C51.5012 62.7778 51.7166 62.7835 52.1525 63.0063Z" fill="white"/>
						<defs>
							<filter id="filter0_d_60_16" x="3.5166" y="4.47681" width="109.731" height="109.782" filterUnits="userSpaceOnUse" color-interpolation-filters="sRGB">
								<feFlood flood-opacity="0" result="BackgroundImageFix"/>
								<feColorMatrix in="SourceAlpha" type="matrix" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 127 0" result="hardAlpha"/>
								<feOffset dx="-1"/>
								<feGaussianBlur stdDeviation="9.5"/>
								<feComposite in2="hardAlpha" operator="out"/>
								<feColorMatrix type="matrix" values="0 0 0 0 0.0313726 0 0 0 0 0.764706 0 0 0 0 0.972549 0 0 0 1 0"/>
								<feBlend mode="normal" in2="BackgroundImageFix" result="effect1_dropShadow_60_16"/>
								<feBlend mode="normal" in="SourceGraphic" in2="effect1_dropShadow_60_16" result="shape"/>
							</filter>
							<linearGradient id="paint0_linear_60_16" x1="26.0799" y1="26.0799" x2="72.9201" y2="72.9201" gradientUnits="userSpaceOnUse">
								<stop stop-color="#228CDB"/>
								<stop offset="0.9999" stop-color="#00D1FF"/>
								<stop offset="1" stop-color="#0092FF"/>
							</linearGradient>
						</defs>
					</svg>
                  <p>#${char['user_id']}</p>
                </div>
                <div class="info-block" style="height: 3.5625vw !important;">
                  <h1>${char['name'].toUpperCase()}</h1>
                </div>
                <div class="info-phone">
				  <h3>${char['phone']}</h3>
                </div>
              </div>
              <div class="button-area">
                <div class="selection-button" data-id="${char['user_id']}">
					<svg width="250" height="54" viewBox="0 0 250 54" fill="none" xmlns="http://www.w3.org/2000/svg">
						<path d="M0 5C0 2.23858 2.23858 0 5 0H208.175C209.775 0 211.278 0.76529 212.218 2.05883L244.224 46.0588C246.628 49.3636 244.267 54 240.18 54H5C2.23857 54 0 51.7614 0 49V5Z" fill="url(#paint0_linear_54_27)"/>
						<path d="M52.2349 36.39C50.3549 36.39 48.8649 35.84 47.7649 34.74C46.6649 33.64 46.1049 32.14 46.0849 30.24H49.1749C49.1949 31.3 49.4649 32.1 49.9849 32.64C50.5249 33.18 51.2749 33.45 52.2349 33.45C53.2149 33.45 53.9549 33.19 54.4549 32.67C54.9749 32.15 55.2349 31.45 55.2349 30.57C55.2349 29.73 54.9249 29.02 54.3049 28.44C53.6849 27.84 52.7449 27.17 51.4849 26.43C50.3849 25.75 49.5049 25.15 48.8449 24.63C48.1849 24.11 47.6149 23.46 47.1349 22.68C46.6749 21.9 46.4449 20.98 46.4449 19.92C46.4449 18.92 46.6749 18.02 47.1349 17.22C47.6149 16.4 48.2849 15.76 49.1449 15.3C50.0249 14.84 51.0449 14.61 52.2049 14.61C53.9849 14.61 55.3949 15.14 56.4349 16.2C57.4749 17.26 58.0149 18.69 58.0549 20.49H54.9649C54.9449 19.51 54.6949 18.77 54.2149 18.27C53.7349 17.77 53.0749 17.52 52.2349 17.52C51.3949 17.52 50.7349 17.74 50.2549 18.18C49.7749 18.62 49.5349 19.22 49.5349 19.98C49.5349 20.56 49.6949 21.07 50.0149 21.51C50.3349 21.95 50.7249 22.34 51.1849 22.68C51.6649 23 52.3349 23.42 53.1949 23.94C54.3149 24.6 55.2149 25.19 55.8949 25.71C56.5749 26.23 57.1549 26.9 57.6349 27.72C58.1149 28.52 58.3549 29.48 58.3549 30.6C58.3549 31.66 58.1149 32.63 57.6349 33.51C57.1549 34.39 56.4449 35.09 55.5049 35.61C54.5849 36.13 53.4949 36.39 52.2349 36.39ZM70.7765 33.15V36H60.1865V15H70.4765V17.85H63.2165V23.94H69.9065V26.73H63.2165V33.15H70.7765ZM83.1047 33.12V36H73.1147V15H76.1447V33.12H83.1047ZM95.1093 33.15V36H84.5193V15H94.8093V17.85H87.5493V23.94H94.2393V26.73H87.5493V33.15H95.1093ZM102.937 36.36C101.057 36.36 99.5675 35.79 98.4675 34.65C97.3875 33.51 96.8475 31.9 96.8475 29.82V21.18C96.8475 19.08 97.3875 17.46 98.4675 16.32C99.5475 15.18 101.027 14.61 102.907 14.61C104.827 14.61 106.327 15.17 107.407 16.29C108.487 17.39 109.067 18.98 109.147 21.06H106.147C106.067 19.84 105.757 18.94 105.217 18.36C104.677 17.78 103.897 17.49 102.877 17.49C101.957 17.49 101.237 17.8 100.717 18.42C100.197 19.04 99.9375 19.96 99.9375 21.18V29.82C99.9375 31.04 100.197 31.96 100.717 32.58C101.257 33.18 101.997 33.48 102.937 33.48C103.957 33.48 104.737 33.19 105.277 32.61C105.837 32.03 106.167 31.14 106.267 29.94H109.267C109.167 32 108.567 33.59 107.467 34.71C106.387 35.81 104.877 36.36 102.937 36.36ZM111.313 15H114.343V36H111.313V15ZM123.44 36.39C121.44 36.39 119.87 35.77 118.73 34.53C117.59 33.27 117.02 31.54 117.02 29.34V21.66C117.02 19.46 117.59 17.74 118.73 16.5C119.87 15.24 121.44 14.61 123.44 14.61C125.44 14.61 127.01 15.24 128.15 16.5C129.29 17.74 129.86 19.46 129.86 21.66V29.34C129.86 31.54 129.29 33.27 128.15 34.53C127.01 35.77 125.44 36.39 123.44 36.39ZM123.44 33.42C124.52 33.42 125.34 33.07 125.9 32.37C126.46 31.67 126.74 30.66 126.74 29.34V21.66C126.74 20.34 126.46 19.33 125.9 18.63C125.34 17.93 124.52 17.58 123.44 17.58C122.36 17.58 121.54 17.93 120.98 18.63C120.42 19.33 120.14 20.34 120.14 21.66V29.34C120.14 30.66 120.42 31.67 120.98 32.37C121.54 33.07 122.36 33.42 123.44 33.42ZM132.57 15H135.6L140.43 25.71C140.79 26.51 141.43 28.05 142.35 30.33L142.44 30.27C142.32 29.25 142.22 28.05 142.14 26.67C142.06 25.29 142.02 24.13 142.02 23.19V15H145.02V36H141.99L137.31 25.71C136.45 23.57 135.78 21.87 135.3 20.61L135.21 20.67C135.31 21.71 135.39 22.93 135.45 24.33C135.53 25.71 135.57 26.9 135.57 27.9V36H132.57V15ZM156.11 31.77H150.56L149.6 36H146.42L151.7 15H154.97L160.25 36H157.1L156.11 31.77ZM155.48 28.95L154.16 23.31C153.86 21.91 153.6 20.41 153.38 18.81H153.29C153.03 20.71 152.77 22.21 152.51 23.31L151.22 28.95H155.48ZM166.598 28.38H164.708V36H161.678V15H167.108C169.108 15 170.658 15.58 171.758 16.74C172.858 17.88 173.408 19.49 173.408 21.57C173.408 23.19 173.078 24.55 172.418 25.65C171.758 26.75 170.828 27.52 169.628 27.96L174.188 36H170.828L166.598 28.38ZM164.708 25.5H167.048C168.108 25.5 168.908 25.17 169.448 24.51C170.008 23.85 170.288 22.89 170.288 21.63C170.288 20.39 170.018 19.46 169.478 18.84C168.938 18.2 168.138 17.88 167.078 17.88H164.708V25.5Z" fill="white"/>
						<defs>
							<linearGradient id="paint0_linear_54_27" x1="-8.82167e-07" y1="27.4154" x2="210.721" y2="27.4154" gradientUnits="userSpaceOnUse">
								<stop stop-color="#FF8A00"/>
								<stop offset="1" stop-color="#FFC700"/>
							</linearGradient>
						</defs>
					</svg>
                </div>
              </div>
            </div>
          </div>
        `;
                });

                for (i = characterList.length; i < 3; i++) {
                    screenCode += `
          <div class="person-area">
            <div class="create-data">
              <div class="title-info">
				<svg width="114" height="115" viewBox="0 0 114 115" fill="none" xmlns="http://www.w3.org/2000/svg">
					<g filter="url(#filter0_d_56_40)">
						<path fill-rule="evenodd" clip-rule="evenodd" d="M24.8037 27.6116C23.9225 29.012 23.509 30.5414 23.5168 32.3707L23.5237 34.008L30.8913 61.3796C34.9433 76.4339 38.3587 89.0484 38.4807 89.4118C38.8139 90.4032 39.7667 91.9264 40.5329 92.6926C41.3791 93.5388 42.8817 94.4403 44.2067 94.8967C45.6591 95.397 48.1077 95.3762 49.6472 94.8505C51.8709 94.0911 50.2846 95.5889 73.1938 72.6193C92.9421 52.8189 93.8404 51.9023 94.1968 51.1857C96.3484 46.8595 95.1124 41.8819 91.2644 39.3761C90.8018 39.0749 90.1941 38.7366 89.914 38.6244C88.8322 38.1913 34.2318 23.6315 33.281 23.5226C31.8094 23.3541 30.0048 23.6579 28.6028 24.3104C27.1602 24.9816 25.6121 26.3268 24.8037 27.6116Z" fill="url(#paint0_linear_56_40)"/>
					</g>
					<path d="M53.6057 49.9995C62.3986 49.999 65.5624 41.1951 66.3905 33.9631C67.4107 25.0542 63.1977 18.3491 53.6057 18.3491C44.0146 18.3491 39.7995 25.0537 40.8206 33.9631C41.6496 41.1951 44.8124 50.0002 53.6057 49.9995Z" fill="white"/>
					<path d="M72.8323 53.6643C73.1153 53.6643 73.3963 53.6729 73.6753 53.6883C73.257 53.0915 72.7728 52.565 72.206 52.1418C70.5164 50.8807 68.3282 50.4669 66.3936 49.7067C65.4519 49.3369 64.6089 48.9694 63.8173 48.5513C61.1456 51.4811 57.6617 53.0137 53.6045 53.0141C49.5488 53.0141 46.0652 51.4814 43.3939 48.5513C42.6023 48.9696 41.7589 49.3369 40.8174 49.7067C38.8829 50.4671 36.6948 50.8807 35.0052 52.1418C32.0831 54.3226 31.328 59.229 30.7347 62.5756C30.245 65.3383 29.916 68.1576 29.82 70.9638C29.7457 73.1374 30.8188 73.4421 32.6373 74.0983C34.9142 74.9194 37.2651 75.5292 39.6319 76.0288C44.2027 76.994 48.9142 77.7359 53.6054 77.7691C55.8784 77.7527 58.1562 77.5695 60.4203 77.2757C58.7439 74.8467 57.7606 71.9043 57.7606 68.7362C57.7606 60.4253 64.5217 53.6643 72.8323 53.6643Z" fill="white"/>
					<path d="M72.8325 56.679C66.1735 56.679 60.7749 62.0773 60.7749 68.7363C60.7749 75.3953 66.1732 80.7936 72.8325 80.7936C79.4914 80.7936 84.8898 75.3953 84.8898 68.7363C84.8898 62.0773 79.4912 56.679 72.8325 56.679ZM78.1076 70.8049H74.901V74.0112C74.901 75.1536 73.9749 76.08 72.8325 76.08C71.69 76.08 70.7636 75.1536 70.7636 74.0112V70.8049H67.5573C66.4148 70.8049 65.4885 69.8788 65.4885 68.736C65.4885 67.5935 66.4146 66.6672 67.5573 66.6672H70.7636V63.4609C70.7636 62.3184 71.69 61.3921 72.8325 61.3921C73.9749 61.3921 74.901 62.3184 74.901 63.4609V66.6672H78.1076C79.2501 66.6672 80.1764 67.5935 80.1764 68.736C80.1762 69.8788 79.2501 70.8049 78.1076 70.8049Z" fill="white"/>
					<defs>
					<filter id="filter0_d_56_40" x="3.5166" y="4.47681" width="109.731" height="109.782" filterUnits="userSpaceOnUse" color-interpolation-filters="sRGB">
						<feFlood flood-opacity="0" result="BackgroundImageFix"/>
						<feColorMatrix in="SourceAlpha" type="matrix" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 127 0" result="hardAlpha"/>
						<feOffset dx="-1"/>
						<feGaussianBlur stdDeviation="9.5"/>
						<feComposite in2="hardAlpha" operator="out"/>
						<feColorMatrix type="matrix" values="0 0 0 0 0.0313726 0 0 0 0 0.764706 0 0 0 0 0.972549 0 0 0 1 0"/>
						<feBlend mode="normal" in2="BackgroundImageFix" result="effect1_dropShadow_56_40"/>
						<feBlend mode="normal" in="SourceGraphic" in2="effect1_dropShadow_56_40" result="shape"/>
					</filter>
						<linearGradient id="paint0_linear_56_40" x1="26.0799" y1="26.0799" x2="72.9201" y2="72.9201" gradientUnits="userSpaceOnUse">
							<stop stop-color="#228CDB"/>
							<stop offset="0.9999" stop-color="#00D1FF"/>
							<stop offset="1" stop-color="#0092FF"/>
						</linearGradient>
					</defs>
				</svg>
              </div>
              <div class="mid-info">
                <p>Clique aqui para criar um novo personagem que você pode comprar no Life Invader.</p>
              </div>
            </div>
          </div>
        `;
                }

                $('.selection-grid-box').html(screenCode);
            }
        );
    }
});

$(document).on('click', '.selection-button', function (e) {
    $.post('http://spawn/characterChosen',JSON.stringify({ id: parseInt(e['currentTarget']['dataset']['id']) }));
    $('#charPage').css('display', 'none');
});

$(document).on('click', '.create-data', function (e) {
    $('#charPage').fadeOut('100').css('display', 'none');
    $('#charRegister').fadeIn('100').css('display', 'flex');
});

$(document).on('click', '.return-button', function (e) {
    $('#charPage').fadeIn('100').css('display', 'flex');
    $('#charRegister').fadeOut('100').css('display', 'none');
});

$(document).on('click', '.spawn-button', function (e) {
    let hashCode = parseInt(e['currentTarget']['dataset']['hash']);
    if (hashCode === 3) { hashCode = 'spawn'; }
    $.post('http://spawn/spawnChosen',JSON.stringify({ hash: hashCode, }));
});

$(document).on("click",".submit-button",function(e){
	var nome = $("#name").val();
	var sobrenome = $("#lastname").val();
	var sexo = $('.change.male.active, .change.female.active').attr('data-value');

	if (nome != "" && nome.length >= 3 && sobrenome != "" && sobrenome.length >= 3 && (sexo == "M" || sexo == "F")){
		if (sexo == "M"){ sexo = "mp_m_freemode_01" } else { sexo = "mp_f_freemode_01" }
		$.post("http://spawn/newCharacter",JSON.stringify({ name: nome, name2: sobrenome, sex: sexo }));
	}
});