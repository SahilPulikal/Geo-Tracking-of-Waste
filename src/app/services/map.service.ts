import { Injectable } from "@angular/core";
import { HttpClient } from "@angular/common/http";
import { Observable } from "rxjs";
@Injectable({
  providedIn: "root"
})
export class MapService {
  constructor(private httpClient: HttpClient) {}
  private grantType: string = "client_credentials";

  private clientId: string =
    "33OkryzDZsKP_oNgM4_ZUpK2HKF_I4qIUx9weWKG5lQYQwPfGrumMD9IiazL0gD_Xd9kJIhgqQ9YmsRCJ1WA-QSNAZ38L0CUGKBepPmDfeA_28hhZ07WIw==";
  private clientSecret: string =
    "lrFxI-iSEg9pWad6-gmTfSW9Pi6HG7_VePuJjho55VRhBfJK1zh7GjLwa1fGWUJUHoTyjBiSXunFzgPIlzIcGqsp9DSbtVS05vC4-5kFlsqQISxayKvXk6UrX3OGmk2M";
  private securityURL: string =
    "https://outpost.mapmyindia.com/api/security/v3.0.5/oauth/token?grant_type=" +
    this.grantType +
    "&client_id=" +
    this.clientId +
    "&client_secret=" +
    this.clientSecret;
  private autoSuggestURL: string =
    "https://atlas.mapmyindia.com/api/places/search/json?";
  // "https://atlas.mapmyindia.com/api/places/search/json?query=agra&location=19.177963,72.974657&bridge&explain&username=balmukand";
  private nearbyURL: string =
    "https://atlas.mapmyindia.com/api/places/nearby/json?explain&richData&username=balmukand&refLocation=19.1799,72.98017&keywords=FINATM";

  getToken() {
    let promise = new Promise((resolve, reject) => {
      let apiURL = this.securityURL;
      this.httpClient
        .post(apiURL, null)
        .toPromise()
        .then(res => {
          // Success
          resolve(res);
        });
    });
    return promise;
  }

  autoSuggest(token: string) {
    const _url = this.autoSuggestURL + "&access_token=" + token;
    const promise = new Promise((resolve, reject) => {
      this.httpClient
        .get(_url)
        .toPromise()
        .then(res => {
          // Success
          console.log(res);
          resolve(res);
        });
    });
    return promise;
  }

  nearby(token: string) {
    const _url = this.nearbyURL + "&access_token=" + token;
    const promise = new Promise((resolve, reject) => {
      this.httpClient
        .get(_url)
        .toPromise()
        .then(res => {
          // Success
          //console.log(res);
          resolve(res);
        });
    });
    return promise;
  }

  // current loc
  getPosition(): Promise<any> {
    return new Promise((resolve, reject) => {
      navigator.geolocation.getCurrentPosition(
        resp => {
          resolve({ lng: resp.coords.longitude, lat: resp.coords.latitude });
        },
        err => {
          reject(err);
        }
      );
    });
  }
}
